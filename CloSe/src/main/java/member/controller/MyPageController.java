package member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.EventBean;
import member.model.EventDao;
import member.model.MemberBean;
import style.model.StyleDao;

@Controller
public class MyPageController {

	private final String command = "/mypage.member";

	@Autowired
	private EventDao eventDao;
	@Autowired
	private StyleDao styleDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public void mypage(HttpSession session, Model model) {
		MemberBean memberBean = (MemberBean) session.getAttribute("loginInfo");
		MemberBean kakaoMemberBean = (MemberBean) session.getAttribute("kakaoLoginInfo");

		List<EventBean> lists = new ArrayList<EventBean>();
		if (memberBean != null) {
			lists = eventDao.selectCoupon(memberBean.getMember_id());
			model.addAttribute("styleList", styleDao.getStyleByMemberId(memberBean.getMember_id()));
			if (!lists.isEmpty()) {
				session.setAttribute("loginLists", lists);
			}
		}

		List<EventBean> kakaoLists = new ArrayList<EventBean>();
		if (kakaoMemberBean != null) {
			kakaoLists = eventDao.selectCoupon(kakaoMemberBean.getMember_id());
			model.addAttribute("styleList", styleDao.getStyleByMemberId(kakaoMemberBean.getMember_id()));
			if (!kakaoLists.isEmpty()) {
				session.setAttribute("kakaoLoginLists", kakaoLists);
			}
		}

		if (lists.isEmpty() && kakaoLists.isEmpty()) {
			System.out.println("쿠폰이 없습니다.");
		}
	}

}
