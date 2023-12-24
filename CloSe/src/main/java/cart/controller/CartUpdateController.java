package cart.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cart.model.CartDao;
import member.model.MemberBean;

@Controller
public class CartUpdateController {
	private final String command = "/qtyUpdate.cart";
	private final String viewPage = "cartListForm";
	private final String gotoPage = "redirect:/cartAdd.cart";
	
	@Autowired
	CartDao cartDao;
	
	@RequestMapping(command)
	public String qtyUpdate(@RequestParam("cart_number")String cart_number,
							@RequestParam("qty")String qty,
							HttpSession session) {
		Map<String,String> qtyMap = new HashMap<String, String>();
		qtyMap.put("cart_number", cart_number);
		qtyMap.put("qty", qty);
		
		String member_id ="";
		if(session.getAttribute("loginInfo") != null) {
			MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
			member_id = mb.getMember_id();
		} else if(session.getAttribute("kakaoLoginInfo") != null) {
			MemberBean mb = (MemberBean) session.getAttribute("kakaoLoginInfo");
			member_id = mb.getMember_id();
		}
		
		cartDao.qtyUpdate(qtyMap);
		
		return gotoPage+"?member_id="+member_id;
	}
	
}
