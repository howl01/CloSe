package popular.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import popular.model.PopularBean;
import popular.model.PopularDao;
import redis.RedisService;

@Controller
public class PopularController {
	private final String command = "list.popular";
	private final String viewPage = "main";
	
	@Autowired
	private PopularDao popularDao;
	
	@RequestMapping(command)
	public String list(Model model) {
		List<PopularBean> popularList = popularDao.getAllPopular();
		
		RedisService redisService = new RedisService();
		for(PopularBean popularBean : popularList) {
			redisService.saveDataToSortedSet(popularBean.getPopular_word(), 
									popularBean.getPopular_count());
		}
		
		model.addAttribute("top10Keyword", redisService.getTop10DataFromSortedSet());
		return viewPage;
	}
}
