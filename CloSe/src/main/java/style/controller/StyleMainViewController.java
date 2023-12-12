package style.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StyleMainViewController {
	private final String command = "mainView.style";
	private final String viewPage = "styleMain";
	
	@RequestMapping(command)
	public String mainView() {
		return viewPage;
	}
	
}
