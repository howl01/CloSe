package member.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cart.model.CartDao;
import member.model.MemberBean;
import member.model.MemberDao;
import orders.model.OrdersDao;
import product.model.ProductDao;
import qna.model.QnaDao;
import style.model.StyleDao;

@Controller
public class RegisterController {
   
   private final String command = "/register.member";
   private final String viewPage = "register";
   private final String gotoPage = "main";
   
   @Autowired
   MemberDao memberDao;
   
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