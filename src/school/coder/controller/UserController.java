package school.coder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import school.coder.domain.UserInfo;
import school.coder.service.UserService;
import school.coder.util.CreateMD5;

import java.security.NoSuchAlgorithmException;

/**
 * Created by Administrator on 2018/2/19.
 */
//验证码，注册时验证用户是否已存在
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public ModelAndView login()
    {

        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/login");
        return maView;
    }
    @RequestMapping("/reg")
    public ModelAndView reg()
    {

        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/reg");
        return maView;
    }
    @RequestMapping("/reguser")
    public ModelAndView reguser(UserInfo userInfo) throws NoSuchAlgorithmException {
        userInfo.setUser_phone("");
        userInfo.setUser_pwd(CreateMD5.getMd5(userInfo.getUser_pwd()));
        userService.regUser(userInfo);
        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/index");
        return maView;
    }
}
