package member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.EventBean;
import member.model.EventDao;
import member.model.MemberBean;


@Controller
public class MyPageController {
	
	private final String command = "/mypage.member";
	
	@Autowired
    private EventDao eventDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public void mypage(HttpSession session) {
		
		MemberBean mb = (MemberBean) session.getAttribute("loginInfo");
		List<EventBean> lists = eventDao.selectCoupon(mb.getMember_id());
		System.out.println(lists.size());
		if(lists.size() == 0) {
			System.out.println("쿠폰이 없습니다.");
		}else {
			session.setAttribute("loginLists", lists);
		}
		
	}
	
}
