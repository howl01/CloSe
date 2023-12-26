package main.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import product.model.ProductDao;

@Controller
public class MainViewController {

	private final String command = "view.main";
	private final String viewPage = "main";
	
	@Autowired
	ProductDao productDao; 
	
	@RequestMapping(command)
	public String view(Model model) {
		model.addAttribute("popList", productDao.getPop());
		return viewPage;
	}
	
}
