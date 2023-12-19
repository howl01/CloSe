package cart.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cart.model.CartDao;
import product.model.ProductDao;

@Controller
public class CartUpdateController {
	private final String command = "/qtyUpdate.cart";
	private final String viewPage = "cartListForm";
	private final String gotoPage = "";
	
	@Autowired
	CartDao cartDao;
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping(command)
	public String qtyUpdate(@RequestParam("cart_number")String cart_number,
							@RequestParam("qty")String qty) {
		Map<String,String> qtyMap = new HashMap<String, String>();
		qtyMap.put("cart_number", cart_number);
		qtyMap.put("qty", qty);
		
		cartDao.qtyUpdate(qtyMap);
		
		return "redirect:/cartAdd.cart?member_id='kim'";
	}
	
}
