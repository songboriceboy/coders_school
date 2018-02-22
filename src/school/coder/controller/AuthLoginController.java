package school.coder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * Created by Administrator on 2018/2/22.
 */
@Controller
@RequestMapping("/auth")
public class AuthLoginController {
    @RequestMapping("/github")
    public ModelAndView github(String code)
    {
        System.out.println(code);
        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/index");

        return maView;
    }
}
