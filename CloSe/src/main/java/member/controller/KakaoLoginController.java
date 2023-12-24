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
	private final String gotoPage = "redirect:view.main";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public void kakaoregister(@RequestParam("member_id") String member_id, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		session.setAttribute("member_id", member_id);
		String prevPage = (String) session.getAttribute("prevPage");
		
		PrintWriter out = response.getWriter();
	    response.setContentType("text/html; charset=UTF-8");
	    
	    MemberBean memberBean = memberDao.findwithId(member_id);//가입한 아이디가 있는지 확인
		
		if(memberBean == null) {
			out.println("<script>alert('등록된 정보가없어 회원가입페이지로 이동합니다.'); location.href='" + request.getContextPath() + "/kakaoRegister.member';</script>");
			out.flush();
		    
		}else {
			session.setAttribute("kakaoLoginInfo", memberBean);
			if (prevPage != null && !prevPage.isEmpty()
					&& !prevPage.equals("http://localhost:8080/ex/register.member")) {
				// 이전 페이지의 URL을 세션에서 제거
				session.removeAttribute("prevPage");
				out.println("<script>alert('로그인 되었습니다.'); location.href='" + prevPage + "';</script>");
				out.flush();
			} else {
				// 이전 페이지의 URL이 없으면 기본적으로 메인 페이지로 리다이렉트
				out.println("<script>alert('로그인 되었습니다.'); location.href='" + gotoPage + "';</script>");
				out.flush();
			}
		}
		
	}
}
