package review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.model.MemberBean;
import review.model.ReviewBean;
import review.model.ReviewDao;
import review.model.ReviewItem;

@Controller
public class ReviewListController {
	private final String command = "/list.review";
	
	@Autowired
	ReviewDao reviewDao;
	
	@ResponseBody
	@RequestMapping(value = command, produces = "application/json; charset=utf8")
	public List<ReviewItem> reviewRegister(@RequestParam("product_number") String product_number) {
		
		List<ReviewItem> rlists = reviewDao.getReviewByProduct_number(product_number);
		return rlists;
	}
}
