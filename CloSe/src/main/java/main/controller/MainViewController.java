package main.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainViewController {

	private final String command = "view.main";
	private final String viewPage = "main";
	
	@RequestMapping(command)
	public String view(Model model) {
		return viewPage;
	}
	
}
