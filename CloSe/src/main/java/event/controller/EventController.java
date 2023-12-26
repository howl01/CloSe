package event.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {
   
   private final String command = "main.event";
   private final String viewPage = "event";
   
   @RequestMapping(value = command)
   public String main(HttpSession session) {
      
      return viewPage;
   }
}
