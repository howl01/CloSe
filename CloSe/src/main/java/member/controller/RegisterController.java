package member.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;

@Controller
public class RegisterController {
   
   private final String command = "/register.member";
   private final String viewPage = "register";
   private final String gotoPage = "main";
   
   @RequestMapping(value = command, method = RequestMethod.GET)
   public String registerGet() {
      
      return viewPage;
   }
   
   @RequestMapping(value = command, method = RequestMethod.POST)
   public String registerPost(@Valid MemberBean mb, BindingResult bresult) {
      
      if(bresult.hasErrors()) {
         return viewPage;
      }
      
      return gotoPage;
   }
}