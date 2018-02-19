package school.coder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2018/2/19.
 */
@Controller
@RequestMapping("/topic")
public class TopicController {
    @RequestMapping("/new")
    public ModelAndView newTopic()
    {

        ModelAndView maView = new ModelAndView();
        maView.setViewName("front/topic/new");
        return maView;
    }
}
