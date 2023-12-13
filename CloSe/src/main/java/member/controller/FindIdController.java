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
public class FindIdController {
	
	private final String command = "/findid.member";
	private final String viewPage = "findIdForm";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String findid() {
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView findid(@RequestParam("name") String name,
						 @RequestParam("phone") String phone,
						 HttpServletResponse response) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		
		PrintWriter out;
		out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		MemberBean memberBean = memberDao.findwithName(name);
		
		if(memberBean == null) {
			out.println("<script>alert('ȸ�������� �����ϴ�.')</script>");
			out.flush();
			mav.setViewName(viewPage);
			return mav;
		}else {
			if(phone.equals(memberBean.getPhone())) {
				
				String memberId = memberBean.getMember_id();
				String alertMessage = "���̵�� [" + memberId + "] �Դϴ�.";
				
				out.println("<script>alert('" + alertMessage + "')</script>");
				out.flush();
				mav.setViewName(viewPage);
				return mav;
			}else {
				out.println("<script>alert('�޴��� ��ȣ�� ��ġ���� �ʽ��ϴ�.')</script>");
				out.flush();
				mav.setViewName(viewPage);
				return mav;
			}
		}
	}
}
