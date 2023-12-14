package member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class KakaoRegisterController {

	private final String command = "/kakaoRegister.member";
	private final String viewPage = "kakaoRegisterForm";
	private final String gotoPage = "redirect:login.member";

	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String registerGet() {

		return viewPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String registerPost(@Valid MemberBean mb, BindingResult bresult, HttpServletResponse response, Model model){
		if(bresult.hasErrors()) {
			return viewPage;
		}
		model.addAttribute("memberBean", mb);
		memberDao.memberRegister(mb);

		return gotoPage;


	}
}
