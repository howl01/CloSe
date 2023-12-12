package style.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import style.model.StyleDao;

@Controller
public class StyleInsertController {
	
	private final String command = "insert.style";
	private final String viewPage = "styleInsertForm";
	private final String gotoPage = "redirect:/mainView.style";
	
	@Autowired
	private StyleDao styledao;
	
	@RequestMapping(value=command, method = RequestMethod.GET)
	public String insertForm() {
		return viewPage;
	}
	
	@RequestMapping(value=command, method = RequestMethod.POST)
	public String insert() {
		return gotoPage;
	}
}
