package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.PasswordAuthentication;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
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
	
	//��й�ȣ ã�� �̸��� �߼�
	@RequestMapping("/sendEmail.member")
	public ModelAndView sendEmail(@RequestParam("mempassword") String mempassword,
            			  @RequestParam("email") String email,
            			  HttpServletRequest request, HttpServletResponse response) throws AddressException, MessagingException, IOException {
		//���� ���� ����
		String host = "smtp.naver.com";
		final String username = "ksg980105";
		final String password = "@rlatjdrb12";
		int port=465; //���̹� STMP ��Ʈ ��ȣ
		
		//���� ����
		String recipient = email; //������ �߼��� �̸��� �ּ�
		String subject = "[�ʺ�, ������ ��Ÿ�ϸ���Ʈ] ��й�ȣ �˸� ����"; //���� �߼۽� ����
		String body = "ȸ������ ��й�ȣ�� " + mempassword + "�Դϴ�."; //���� �߼۽� ����
		
		Properties props = System.getProperties();
		
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
			String un = username;
			String pw = password;
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true);
		
		Message mimeMessage = new MimeMessage(session);
		mimeMessage.setFrom(new InternetAddress("ksg980105@naver.com"));
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		mimeMessage.setSubject(subject);
		mimeMessage.setText(body);
		Transport.send(mimeMessage);
		
		PrintWriter out = response.getWriter();
	    response.setContentType("text/html; charset=UTF-8");
	    out.println("<script>alert('�̸��Ϸ� ��й�ȣ�� ���۵Ǿ����ϴ�.')</script>");
	    out.flush();
	    
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName(gotoPage);
		return mav;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public ModelAndView findpw(
						@RequestParam("member_id") String member_id,
						@RequestParam("phone") String phone,
						@RequestParam("email") String email,
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
			if(phone.equals(memberBean.getPhone())) { //��ȭ��ȣ�� ��ġ�Ҷ�
				if(email.equals(memberBean.getEmail())) { //�̸����ּҰ� ��ġ�Ҷ�
					String mempassword = memberBean.getPassword();
					
					response.sendRedirect("sendEmail.member?mempassword=" + mempassword + "&email=" + email);
					return null;
					
				}else { 
					out.println("<script>alert('�̸����ּҰ� ��ġ���� �ʽ��ϴ�.')</script>");
					out.flush();
					mav.setViewName(viewPage);
					return mav;
				}
				
			}else { //��ȭ��ȣ ��ġ ���Ҷ�
				out.println("<script>alert('�޴�����ȣ�� ��ġ���� �ʽ��ϴ�.')</script>");
				out.flush();
				mav.setViewName(viewPage);
				return mav;
			}
		}
	}
}
