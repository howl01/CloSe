package style.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import style.model.LikeBean;
import style.model.LikeDao;

@Controller
public class StyleLikeController {
	private final String command = "like.style";
	private final String gotoPage = "redirect:detail.style";
	
	@Autowired
	private LikeDao likeDao;
	
	@RequestMapping(command)
	public String like(@RequestParam("style_number") int style_number, @RequestParam("member_id") String member_id) {
		LikeBean likeBean = new LikeBean();
		likeBean.setMember_id(member_id);
		likeBean.setStyle_number(style_number);
		
		likeDao.like(likeBean);
		
		return gotoPage + "?style_number=" + style_number;
	}
	
}
