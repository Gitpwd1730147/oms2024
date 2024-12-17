package com.tzb.oms.controller;

import com.google.code.kaptcha.Producer;
import com.tzb.oms.entity.LoginUser;
import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.User;
import com.tzb.oms.service.UserService;
import com.tzb.oms.utils.CurrentUser;
import com.tzb.oms.utils.DigestUtil;
import com.tzb.oms.utils.TokenUtils;
import com.tzb.oms.utils.OmsConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * AUTHOR: TZB
 * DATE:  2023/11/2
 */
@RestController
public class LoginController {
    //注入DefaultKaptcha的bean对象，生成验证码图片的
    @Resource(name = "captchaProducer")
    private Producer producer;

    //注入redis模版
    @Autowired
    private StringRedisTemplate redisTemplate;

    //注入UserService
    @Autowired
    private UserService userService;

    //注入TokenUtils
    @Autowired
    private TokenUtils tokenUtils;



    /**
     * 生成验证码
     * @param response
     */
    @RequestMapping("/captcha/captchaImage")
    public void captchaImage(HttpServletResponse response){

        ServletOutputStream out = null;
        try {
            //生产验证码图片文本
            String text = producer.createText();
            //使用验证码文本生成验证码图片,BufferedImage生成的对象代表验证码图片，在内存中
            BufferedImage image = producer.createImage(text);
            //将验证码文本作为键，保存在redis中---设置键值的过期时间
            redisTemplate.opsForValue().set(text,"",60*30, TimeUnit.SECONDS);

            /**
             * 将验证码显示给前端
             */
            //设置响应正文image/jpeg
            response.setContentType("image/jpeg");
            //将验证码图片写给前端
            out = response.getOutputStream();

            ImageIO.write(image,"jpg",out);

            out.flush();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }finally {
            if (out!=null) {
                try {
                    out.close();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }
    }

    /**
     * 登录的url接口/login
     */
    @RequestMapping("/login")
    public Result login(@RequestBody LoginUser loginUser) {
		/*
		  校验验证码：
		 */
        if(Boolean.FALSE.equals(redisTemplate.hasKey(loginUser.getVerificationCode()))){
            return Result.err(Result.CODE_ERR_BUSINESS, "验证码不正确！");
        }


		/*
		  校验用户名密码:
		 */
        //根据用户名查询用户
        User user = userService.findUserByCode(loginUser.getUserCode());
        if (user!=null) {//查到了用户
            if (user.getUserState().equals(OmsConstants.USER_STATE_PASS)) {//查到的用户状态是已审核
                //将用户录入的密码进行加密
                String password = DigestUtil.hmacSign(loginUser.getUserPwd());
                if (password.equals(user.getUserPwd())) {//查到的用户的密码和用户录入的密码相同
                    //生成token并响应给前端
                    CurrentUser currentUser = new CurrentUser(user.getUserId(), user.getUserCode(), user.getUserName(),user.getUserPwd());
                    String token = tokenUtils.loginSign(currentUser, user.getUserPwd());
                    return Result.ok("登录成功！", token);
                } else {//查到的用户的密码和用户录入的密码不同
                    return Result.err(Result.CODE_ERR_BUSINESS, "密码不正确！");
                }
            } else {//查到的用户状态是未审核
                return Result.err(Result.CODE_ERR_BUSINESS, "用户未审核！");
            }
        }else{//没有查到用户
            return Result.err(Result.CODE_ERR_BUSINESS, "该用户不存在！");
        }
    }

    /**
     * 获取当前登录用户信息的url接口/curr-user
     *
     * @RequestHeader(OmsConstants.HEADER_TOKEN_NAME) String clientToken
     * 将请求头Token的值即前端归还的token,赋值给请求处理方法的参数String clientToken
     */
    @GetMapping("/curr-user")
    public Result currUser(@RequestHeader(OmsConstants.HEADER_TOKEN_NAME) String clientToken) {
        //从前端归还的token中解析出当前登录用户的信息
        CurrentUser currentUser = tokenUtils.getCurrentUser(clientToken);
        return Result.ok(currentUser);
    }

    /**
     * 登出的url接口/logout
     *
     * @RequestHeader(OmsConstants.HEADER_TOKEN_NAME) String clientToken
     * 将请求头Token的值即前端归还的token,赋值给请求处理方法的参数String clientToken
     */
    @DeleteMapping("/logout")
    public Result logout(@RequestHeader(OmsConstants.HEADER_TOKEN_NAME) String clientToken) {
        //从redis移除token
        redisTemplate.delete(clientToken);
        return Result.ok();
    }


}
