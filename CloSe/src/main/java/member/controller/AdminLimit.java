package member.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class AdminLimit {

	private final String command = "limit.member";
	private final String gotoPage = "adminPage";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String limit(@RequestParam("member_id") String member_id) {
		
		MemberBean memberBean = memberDao.getMember(member_id);
		
		LocalDate now = LocalDate.now();
		
		switch (memberBean.getBan_count()) {
		case 0 :
			memberBean.setBan_expiration(now.plusDays(7));
			break;
		case 1:
			memberBean.setBan_expiration(now.plusDays(30));
			break;
		case 3:
			memberBean.setBan_expiration(now.plusYears(1000));
			break;
		}
		
		memberBean.setBan_count(memberBean.getBan_count() + 1);
		
		int cnt = memberDao.updateMemberBan(memberBean);
		
		if(cnt == -1) {
			System.out.println("update memberBan ����" );
		}else {
			System.out.println("update memberBan ����" );
		}
		
		return gotoPage;
	}
}
