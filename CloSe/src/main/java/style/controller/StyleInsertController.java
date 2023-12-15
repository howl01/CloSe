package style.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import style.model.StyleBean;
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
	public String insert(StyleBean styleBean, @RequestParam("image") String image) {
		
		System.out.println(image);
		System.out.println(styleBean.getProduct_number1());
		System.out.println(styleBean.getTitle());
		System.out.println(styleBean.getContent());
		System.out.println(styleBean.getStyle());
		return gotoPage;
	}
}
