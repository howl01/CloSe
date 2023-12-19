package orders.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cart.model.CartBean;
import cart.model.CartDao;
import cart.model.CartInfoBean;
import member.model.MemberBean;
import member.model.MemberDao;
import orders.model.OrdersDao;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class OrdersDetailController {
	
	private final String command = "/details.orders";
	private final String command2 = "/details2.orders";
	private final String viewPage = "ordersForm";
	private final String gotoPage = "";
	
	@Autowired
	OrdersDao ordersDao;
	
	@Autowired
	CartDao cartDao;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	ProductDao productDao;
	
	@RequestMapping(value=command)
	public String ordersDetailForm(@RequestParam(value="cnum",required = false)String cnum,
									@RequestParam(value="cnums",required = false)String[] cnums,
									Model model,HttpSession session) {
		
		MemberBean mb = memberDao.getMember("kim");
		model.addAttribute("mb", mb);
		
		if(cnums!=null) {
			List<CartInfoBean> clists = cartDao.getCartInfoByNums(cnums);
			model.addAttribute("clists", clists);
		}
		if(cnum!=null) { 
			CartInfoBean cib = cartDao.getCartInfoByNum(cnum);
			List<CartInfoBean> clists = new ArrayList<CartInfoBean>();
			clists.add(cib);
			model.addAttribute("clists", clists);
		}
		session.removeAttribute("clists");
		return viewPage;
	}
	
	@RequestMapping(value=command2)
	public String orderDetailForm(@RequestParam("product_number")String product_number,
								@RequestParam("member_id")String member_id,
								@RequestParam(value="s_stock", required = false)String s_stock,
								@RequestParam(value="m_stock", required = false)String m_stock,
								@RequestParam(value="l_stock", required = false)String l_stock,
								@RequestParam(value="xl_stock", required = false)String xl_stock,
								Model model, HttpSession session) {
		MemberBean mb = memberDao.getMember("kim");
		model.addAttribute("mb", mb);
		
		
		String[] size = {"S","M","L","XL"}; 
		String[] size_stock = {s_stock,m_stock,l_stock,xl_stock};
		CartInfoBean cib = null;
		List<CartInfoBean> nLists = new ArrayList<CartInfoBean>();
		
		ProductBean pb = productDao.getOneProduct(product_number);
		
		for(int i=0;i<size.length;i++) {
			if(size_stock[i] != null) {
				cib = new CartInfoBean();
				cib.setProduct_number(Integer.parseInt(product_number));
				cib.setImage(pb.getImage());
				cib.setProduct_name(pb.getProduct_name());
				cib.setMember_id(member_id);
				cib.setProduct_size(size[i]);
				cib.setQty(Integer.parseInt(size_stock[i]));
				cib.setPrice(pb.getPrice());
				
				nLists.add(cib);
			}
		}
		session.setAttribute("clists", nLists);
		return viewPage;
	}
}
