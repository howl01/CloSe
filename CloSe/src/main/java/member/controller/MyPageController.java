package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MyPageController {
	
	private final String command = "/mypage.member";
	private final String viewPage = "mypage";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String mypage() {
		
		return viewPage;
	}
	
}
