package member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class RefundMessageController {
	
   @RequestMapping(value = "/sendSms.member")
   public String sendSms(HttpServletRequest request) throws Exception {

     String hp1 = request.getParameter("hp1");
     String hp2 = request.getParameter("hp2");
     String hp3 = request.getParameter("hp3");
      System.out.println(hp1+"-"+hp2+"-"+hp3);
     String api_key = null;
     String api_secret = null;
     Message coolsms = new Message(api_key, api_secret);
     
     HashMap<String, String> set = new HashMap<String, String>();
     set.put("to", hp1+hp2+hp3);

     String random = String.valueOf((int)(Math.random()*999999+10000));
     set.put("from", "01051910438");
     set.put("text", "인증번호는 ["+random+"] 입니다.");
     set.put("type", "sms");
     set.put("app_version", "test app 1.2"); 

     System.out.println(set);
     try {
     JSONObject result = coolsms.send(set);

     System.out.println(result.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }

     return "register";
   }

}