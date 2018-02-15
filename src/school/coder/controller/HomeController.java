package school.coder.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping("/")
	public ModelAndView index()
	{
		System.out.println("hello");
		ModelAndView maView = new ModelAndView();
		maView.setViewName("front/index");
		return maView;
	}

}
