package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		
		if(memberBean == null) {
			out.println("<script>alert('�������� ���� ȸ���Դϴ�.')</script>");
			out.flush();
			mav.setViewName(viewPage);
			return mav;
		}else { //���̵� ������
			if(memberBean.getPassword().equals(mb.getPassword())) {	//����� ��ġ��
				session.setAttribute("loginInfo", memberBean); //DB���� ������ ���ڵ带 loginInfo�� ����
				out.println("<script>alert('�α��� �Ǿ����ϴ�.')</script>");
				out.flush();
				mav.setViewName(gotoPage);
				return mav;
				
			}else { //����� ��ġ����
				out.println("<script>alert('����� �߸��Ǿ����ϴ�.')</script>");
				out.flush();
				mav.setViewName(viewPage);
				return mav;
			}
		}
	}
}
