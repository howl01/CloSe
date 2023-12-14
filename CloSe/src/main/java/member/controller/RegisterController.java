package member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class RegisterController {
   
   private final String command = "/register.member";
   private final String viewPage = "registerForm";
   private final String gotoPage = "loginForm";
   
   @Autowired
   private MemberDao memberDao;
   
   @RequestMapping(value = command, method = RequestMethod.GET)
   public String registerGet() {
      
      return viewPage;
   }
   
   @RequestMapping(value = command, method = RequestMethod.POST)
   public String registerPost(@Valid MemberBean mb, BindingResult bresult, 
		   					HttpSession session, HttpServletResponse response){
	   if(bresult.hasErrors()) {
		   	session.setAttribute("registercheck", false);
	        return viewPage;
	      }
	   	
	      memberDao.memberRegister(mb);
	      session.setAttribute("registercheck", true);
	      
	      return gotoPage;
   }
   
}