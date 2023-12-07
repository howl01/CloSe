package style.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import category.model.CategoryDao;

@Controller
public class StyleMainViewController {
	private final String command = "mainView.style";
	private final String viewPage = "styleMain";
	
	@Autowired
	private CategoryDao categoryDao;
	
	@RequestMapping(command)
	public String mainView() {
		return viewPage;
	}
	
}
