package com.tzb.oms.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * AUTHOR: TZB
 * DATE:  2024/5/13
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class EditPwdUser {

    private String oldPassword;  //旧密码

    private String password;  //新密码

    private String rePassword;  //确认新密码
}
