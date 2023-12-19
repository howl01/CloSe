package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberDao;

@Controller
public class DeleteController {
	
	private final String command = "/delete.member";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value = command)
	public void delete(@RequestParam("member_id") String member_id, HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		PrintWriter out;
		out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		memberDao.memberDelete(member_id);
		
		out.println("<script>alert('È¸¿øÅ»Åð µÇ¾ú½À´Ï´Ù.'); location.href='" + request.getContextPath() + "/logout.jsp';</script>");
		out.flush();
	}
}
