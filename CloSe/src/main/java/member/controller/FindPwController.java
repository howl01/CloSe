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
		
		if(memberBean == null) { //ȸ�������� ������
			out.println("<script>alert('ȸ�������� �����ϴ�.')</script>");
			out.flush();
			mav.setViewName(viewPage);
			return mav;
		
		}else { //ȸ�������� ������
			if(name.equals(memberBean.getName())) { //�̸��� ��ġ�Ҷ�
				if(phone.equals(memberBean.getPhone())) { //��ȭ��ȣ�� ��ġ�Ҷ�
					String password = memberBean.getPassword();
					String alertMessage = "��й�ȣ�� [" + password + "] �Դϴ�.";
					
					out.println("<script>alert('" + alertMessage + "')</script>");
					out.flush();
					mav.setViewName(gotoPage);
					return mav;
					
				}else { //��ȭ��ȣ ��ġ ���Ҷ�
					out.println("<script>alert('�޴��� ��ȣ�� ��ġ���� �ʽ��ϴ�.')</script>");
					out.flush();
					mav.setViewName(viewPage);
					return mav;
				}
				
			}else { //�̸��� ��ġ���� ������
				out.println("<script>alert('�̸��� ��ġ���� �ʽ��ϴ�.')</script>");
				out.flush();
				mav.setViewName(viewPage);
				return mav;
			}
		}
	}
}
