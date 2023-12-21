package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class LoginController {

	private final String command = "/login.member";
	private final String viewPage = "loginForm";
	private final String gotoPage = "../main/main";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String login() {
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView login(MemberBean mb, HttpServletResponse response, HttpSession session) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		PrintWriter out;
		out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		MemberBean memberBean = memberDao.getDetail(mb.getMember_id());
		
		LocalDate now = LocalDate.now();
		
		if(memberBean == null) {
			out.println("<script>alert('가입하지 않은 회원입니다.')</script>");
			out.flush();
			mav.setViewName(viewPage);
			return mav;
		}else { //아이디 존재함
			if(memberBean.getPassword().equals(mb.getPassword())) {	//비번이 일치함
				if(memberBean.getBan_count() > 0 && memberBean.getBan_expiration() != null) {
					LocalDate expirationDate = memberBean.getBan_expiration();
					if(now.isBefore(expirationDate)) {
						out.println("<script>alert('규칙 위반으로 계정 이용 정지 기간입니다.')</script>");
						out.flush();
						mav.setViewName(viewPage);
						return mav;
				}
				} else {
					out.println("<script>alert('로그인 되었습니다.')</script>");
					out.flush();
					mav.setViewName(gotoPage);
					session.setAttribute("loginInfo", memberBean); //DB에서 가져온 레코드를 loginInfo로 설정
					return mav;
				}
			}else { //비번이 일치안함
				out.println("<script>alert('비번이 잘못되었습니다.')</script>");
				out.flush();
				mav.setViewName(viewPage);
				return mav;
			}
		}
		return mav;
	}
}