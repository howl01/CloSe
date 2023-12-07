package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	private final String command = "/login.member";
	private final String viewPage = "loginForm";
	private final String gotoPage = "";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String login() {
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String login(@RequestParam("id") String id,
						@RequestParam("password") String password) {
		
		System.out.println(id + password);
		return gotoPage;
	}
}
