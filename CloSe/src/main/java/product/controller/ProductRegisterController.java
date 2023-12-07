package product.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import category.model.CategoryBean;
import category.model.CategoryDao;
import product.model.ProductBean;
import product.model.ProductDao;

@Controller
public class ProductRegisterController {
	
	 private final String command = "/register.product";
	 private final String viewPage = "productRegisterForm";
	 private final String gotoPage = "";

	 @Autowired
	 ProductDao productDao;
	 
	 @Autowired
	 CategoryDao categoryDao;
	 
	 @RequestMapping(value=command, method=RequestMethod.GET)
	 public String registerForm(Model model) {
		 List<CategoryBean> lists = categoryDao.getAll(); //카테고리 insert를 위해
		 model.addAttribute("lists", lists);
		 return viewPage;
	 }
	 
	 @RequestMapping(value=command, method=RequestMethod.POST)
	 public String register(@ModelAttribute("productBean") @Valid ProductBean pb,BindingResult bresult) {
//		 if(bresult.hasErrors()) {
//			 return viewPage;
//		 }
		 productDao.insertProduct(pb);
		 return gotoPage;
	 }
	 
	 
}
