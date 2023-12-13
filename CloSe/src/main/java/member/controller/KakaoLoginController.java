package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class KakaoLoginController {
	
	private final String command = "/kakaologin.member";
	private final String viewPage = "kakaoRegisterForm";
	private final String gotoPage = "loginForm";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String kakaoregister(@RequestParam("member_id") String member_id, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		session.setAttribute("member_id", member_id);
		
		PrintWriter out = response.getWriter();
	    response.setContentType("text/html; charset=UTF-8");
	    
		int cnt = memberDao.findId(member_id);
		
		if(cnt == 0) {
			return viewPage;
		    
		}else {
			out.println("<script>alert('로그인 되었습니다.'); location.href='" + request.getContextPath() + "/view.main';</script>");
			out.flush();
		}
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String kakaoregister(@Valid MemberBean mb, BindingResult bresult) {
		
		if(bresult.hasErrors()) {
			
			return viewPage;
		}
		
		memberDao.memberRegister(mb);
		return gotoPage;
	}
}
