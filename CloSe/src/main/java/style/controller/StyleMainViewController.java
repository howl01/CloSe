package style.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import style.model.StyleBean;
import style.model.StyleDao;

@Controller
public class StyleMainViewController {
	private final String command = "mainView.style";
	private final String viewPage = "styleMain";
	
	@Autowired
	private StyleDao styleDao;
	
	@RequestMapping(command)
	public String mainView(Model model) {
		model.addAttribute("styleList", styleDao.getStyleList());
		return viewPage;
	}
	
}
