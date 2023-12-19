package cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cart.model.CartBean;
import cart.model.CartDao;
import cart.model.CartInfoBean;
import product.model.ProductDao;

@Controller
public class CartAddController {

	private final String command = "/cartAdd.cart";
	private final String viewPage = "cartListForm";
	private final String gotoPage = "";
	
	@Autowired
	CartDao cartDao;
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String cartAdd( @RequestParam("product_number")int product_number,
							@RequestParam("member_id")String member_id,
							@RequestParam(value="s_stock", required = false)String s_stock,
							@RequestParam(value="m_stock", required = false)String m_stock,
							@RequestParam(value="l_stock", required = false)String l_stock,
							@RequestParam(value="xl_stock", required = false)String xl_stock,
							HttpServletRequest request) {
		String[] size = {"S","M","L","XL"}; 
		String[] size_stock = {s_stock,m_stock,l_stock,xl_stock};
		CartBean cb = null;
		List<CartBean> cartLists = null;
		cartLists = cartDao.getAllCartByMember_Id(member_id); //전카트정보로 이미 카트에 있는 상품이면 개수만 추가하게 
		
		for(int i=0;i<size.length;i++) {
			if(size_stock[i] != null) {
				boolean flag = false; 
				
				cb = new CartBean();
				cb.setProduct_number(product_number);
				cb.setMember_id(member_id);
				cb.setProduct_size(size[i]);
				cb.setQty(Integer.parseInt(size_stock[i]));
				
				for(int j=0;j<cartLists.size();j++) {
					CartBean cb0 = cartLists.get(j);
					if(cb0.getProduct_number() == product_number
						&& cb0.getProduct_size().equals(size[i])) { //이미 같은 사이즈의 상품이 들어있나 체크
						flag = true;
						break;
					} 
				} //for
				if(flag) { //있음
					cartDao.updateCart(cb);
				} else { //없음
					cartDao.addCart(cb);
				}
			}
		}
		return "redirect:" + command +"?member_id="+member_id;
	}
	
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String cartForm(@RequestParam("member_id")String member_id,
							Model model) {
		List<CartInfoBean> cartInfoLists = cartDao.getAllCartInfoByMember_Id(member_id);
		model.addAttribute("cartInfoLists", cartInfoLists);
		return viewPage;
	}
}
