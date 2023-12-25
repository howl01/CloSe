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

import category.model.CategoryBean;
import category.model.CategoryDao;
import product.model.ProductBean;
import product.model.ProductDao;
import utility.Paging_productList;

@Controller
public class ProductListController {

	private final String command = "/list.product";
	private final String viewPage = "productList";
	
	@Autowired
	ProductDao productDao; 
	
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping(value=command)
	public String productList(@RequestParam(value="bigcategory_name",  required = false) String bigcategory_name,
							@RequestParam(value="smallcategory_name",  required = false) String smallcategory_name,
							@RequestParam(value="whatColumn", required = false) String whatColumn,
							@RequestParam(value="keyword", required = false) String keyword,
							@RequestParam(value="pageNumber", required = false) String pageNumber,
							HttpServletRequest request, Model model) {
		
		List<CategoryBean> clists = categoryDao.getAllCategory();
		model.addAttribute("clists", clists);
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		List<ProductBean> plists = null;
		int totalCount = 0; 
		
		String url = request.getContextPath()+command;
		
		if(bigcategory_name != null) { 
			if(!bigcategory_name.equals("null")) {
				System.out.println("여기들어왔음111111111111111111111111111111111111111");
				totalCount = productDao.getCountByBigcategory(bigcategory_name);
			}
		}
		if(smallcategory_name != null) {
			if(!smallcategory_name.equals("null")) {
				System.out.println("여기들어왔음22222222222222222222222222222222222222222");
				totalCount = productDao.getCountBySmallcategory(smallcategory_name);
			}
		}
		
		Paging_productList pageInfo = new Paging_productList(pageNumber, "2", totalCount, url, whatColumn, keyword, bigcategory_name, smallcategory_name);
		
		if(bigcategory_name != null) {
			if(!bigcategory_name.equals("null")) {
				System.out.println("여기들어왔음33333333333333333333333333333333333333333");
				plists = productDao.getProductByBigcategory(bigcategory_name,pageInfo);
			}
		}
		if(smallcategory_name != null) {
			if(!smallcategory_name.equals("null")) {
				System.out.println("여기들어왔음44444444444444444444444444444444444");
				plists = productDao.getProductBySmallcategory(smallcategory_name,pageInfo);
			}
		}
		
		System.out.println("bigcategory_name="+bigcategory_name);
		System.out.println("smallcategory_name="+smallcategory_name);
		System.out.println("pageNumber="+pageNumber);
		System.out.println("totalCount="+totalCount);
		
		
		
		
		
		
		
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("plists", plists);
		return viewPage;
	}
	
	
	
	
}
