package orders.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cart.model.CartDao;
import member.model.MemberBean;
import member.model.MemberDao;
import orderdetail.model.OrdersDetailDao;
import orders.model.OrdersBean;
import orders.model.OrdersDao;
import product.model.ProductDao;
import utility.Paging_orderDetail;

@Controller
public class OrdersListController {
   
   private final String command = "/list.orders";
   private final String viewPage = "ordersList";
   
   @Autowired
   OrdersDao ordersDao;
   
   @Autowired
   MemberDao memberDao;
   
   @RequestMapping(value=command)
   public String ordersDetailForm(@RequestParam(value="startDate", required = false) String startDate,
                           @RequestParam(value="endDate", required = false) String endDate,
                           @RequestParam(value="pageNumber", required = false) String pageNumber,
                           HttpServletRequest request,
                           Model model) {
      if(startDate != null) {
         if(startDate.equals("null")) {
            startDate = "";
         }
      }
      if(endDate != null) {
         if(endDate.equals("null")) {
            endDate = "";
         }
      }
      
      String member_id = "kim";
      Map<String, String> map = new HashMap<String, String>();
      map.put("member_id", member_id);
      map.put("startDate", startDate);
      map.put("endDate", endDate);
      
      int totalCount = ordersDao.getTotalCount(map);
      String url = request.getContextPath()+command;
      
      System.out.println("totalCount개수"+totalCount);
      
      Paging_orderDetail pageInfo = new Paging_orderDetail(pageNumber, "2", totalCount, url, startDate, endDate);
      map.put("begin", String.valueOf(pageInfo.getBeginRow()));
      map.put("end", String.valueOf(pageInfo.getEndRow()));
      
      List<OrdersBean> olists = ordersDao.getOrderByMember_Id(pageInfo,map);
      
      MemberBean mb = memberDao.getMember(member_id);
      model.addAttribute("mb", mb);
      
      //List<OrdersBean> olists = ordersDao.getOrderByMember_Id(member_id);
      model.addAttribute("olists", olists);
      model.addAttribute("pageInfo", pageInfo);
      
      return viewPage;
   }
   
}