package com.tzb.oms.controller;

import com.tzb.oms.entity.EditPwdUser;
import com.tzb.oms.entity.Result;
import com.tzb.oms.entity.User;
import com.tzb.oms.service.UserService;
import com.tzb.oms.utils.CurrentUser;
import com.tzb.oms.utils.DigestUtil;
import com.tzb.oms.utils.OmsConstants;
import com.tzb.oms.utils.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/13
 */
@RestController
public class UserController {

    //注入UserService
    @Autowired
    private UserService userService;

    //注入TokenUtils
    @Autowired
    private TokenUtils tokenUtils;

    @PostMapping("/updatePwd")
    public Result updatePwd(@RequestBody EditPwdUser editPwdUser, @RequestHeader(OmsConstants.HEADER_TOKEN_NAME) String clientToken){
        //获取当前用户信息
        CurrentUser currentUser = tokenUtils.getCurrentUser(clientToken);

        //获取从前端传过来的数据
        String oldPassword = editPwdUser.getOldPassword();
        String password = editPwdUser.getPassword();
        String rePassword = editPwdUser.getRePassword();

        //判断新密码和确认密码是否相同
        if (!Objects.equals(password, rePassword)) {
            return Result.err(Result.CODE_ERR_BUSINESS,"新密码和确认密码要相同");
        }

        //判断旧密码是否正确
        if (!currentUser.getUserPwd().equals(DigestUtil.hmacSign(oldPassword))) {
            return Result.err(Result.CODE_ERR_BUSINESS,"请输入正确的旧密码！");
        }

        //封装数据
        //创建User对象并保存用户id和新密码
        User user = new User();
        user.setUserId(currentUser.getUserId());
        user.setUserPwd(DigestUtil.hmacSign(password));

        //根据用户id修改密码
        int i = userService.modifyPwdById(user);

        if (i > 0) {//密码修改成功
            return Result.ok("密码修改成功，请退出重新登录！");
        }

        //密码修改失败
        return Result.err(Result.CODE_ERR_BUSINESS,"密码修改失败！");
    }
}
