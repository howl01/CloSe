package product.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import category.model.CategoryBean;
import category.model.CategoryDao;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductDetailController {

	private final String command = "/detail.product";
	private final String viewPage = "productDetailForm";
	private final String gotoPage = "";

	@Autowired
	ProductDao productDao;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String detailForm(@RequestParam("product_number") String product_number ,Model model) {
		ProductBean pb = productDao.getOneProduct(product_number);
		model.addAttribute("pb", pb);
		return viewPage;
	}
}
