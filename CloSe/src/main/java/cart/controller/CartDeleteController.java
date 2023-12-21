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
public class CartDeleteController {
	private final String command = "/delete.cart";
	private final String viewPage = "";
	private final String gotoPage = "";
	
	@Autowired
	CartDao cartDao;
	
	@RequestMapping(command)
	public String qtyUpdate(@RequestParam(value="cnum",required = false)String cnum,
							@RequestParam(value="cnums",required = false)String[] cnums) {

		if(cnums!=null) {
			cartDao.deleteCarts(cnums);
		}
		if(cnum!=null) {
			cartDao.deleteCart(cnum);
		}
		
		return "redirect:/cartAdd.cart?member_id='kim'";
	}
	
}
