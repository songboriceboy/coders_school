package school.coder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2018/2/15.
 */

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/")
    public ModelAndView index()
    {
        System.out.println("hello");
        ModelAndView maView = new ModelAndView();
        maView.setViewName("admin/index");
        return maView;
    }

}