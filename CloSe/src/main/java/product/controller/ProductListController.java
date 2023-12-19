package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductListController {

	private final String command = "/list.product";
	private final String viewPage = "productList";
	private final String gotoPage = "";
	
	@Autowired
	ProductDao productDao; 
	
	
	@RequestMapping(value=command)
	public String productList(@RequestParam(value="bigcategory_name",  required = false) String bigcategory_name,
							@RequestParam(value="whatColumn", required = false) String whatColumn,
							@RequestParam(value="keyword", required = false) String keyword,
							@RequestParam(value="pageNumber", required = false) String pageNumber,
							HttpServletRequest request, Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		
		List<ProductBean> plists = null;
		if(bigcategory_name != null) {
			plists = productDao.getProductByBigcategory(bigcategory_name);
		}
		model.addAttribute("plists", plists);
		return viewPage;
	}
	
	
	
	
}
