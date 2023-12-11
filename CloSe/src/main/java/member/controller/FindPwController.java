package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class FindPwController {
	
	private final String command = "/findpw.member";
	private final String viewPage = "findPwForm";
	private final String gotoPage = "loginForm";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String findpw() {
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView findpw(@RequestParam("name") String name,
						@RequestParam("member_id") String member_id,
						@RequestParam("phone") String phone,
						HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		PrintWriter out;
		out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		MemberBean memberBean = memberDao.findwithId(member_id);
		
		if(memberBean == null) { //회원정보가 없을때
			out.println("<script>alert('회원정보가 없습니다.')</script>");
			out.flush();
			mav.setViewName(viewPage);
			return mav;
		
		}else { //회원정보가 있을때
			if(name.equals(memberBean.getName())) { //이름이 일치할때
				if(phone.equals(memberBean.getPhone())) { //전화번호도 일치할때
					String password = memberBean.getPassword();
					String alertMessage = "비밀번호는 [" + password + "] 입니다.";
					
					out.println("<script>alert('" + alertMessage + "')</script>");
					out.flush();
					mav.setViewName(gotoPage);
					return mav;
					
				}else { //전화번호 일치 안할때
					out.println("<script>alert('휴대폰 번호가 일치하지 않습니다.')</script>");
					out.flush();
					mav.setViewName(viewPage);
					return mav;
				}
				
			}else { //이름이 일치하지 않을때
				out.println("<script>alert('이름이 일치하지 않습니다.')</script>");
				out.flush();
				mav.setViewName(viewPage);
				return mav;
			}
		}
	}
}
