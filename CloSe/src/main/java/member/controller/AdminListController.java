package member.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberDao;
import report.model.ReportBean;
import report.model.ReportDao;
import utility.Paging;

@Controller
public class AdminListController {

	private final String command = "admin.member";
	private final String viewPage = "adminPage";
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	ReportDao reportDao;
	
	@RequestMapping(command)
	public String adminPage(@RequestParam(value = "pageNumber", required = false) String pageNumber,
							@RequestParam(value = "keyword", required = false) String keyword,
							@RequestParam(value = "whatColumn", required = false) String whatColumn,
							HttpServletRequest request,
							Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = reportDao.getTotalCount(map);
		String url = request.getContextPath()+command;
		
		Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword);
		
		int number = totalCount - (pageInfo.getPageNumber() -1) * 10;
		
		List<ReportBean> lists = reportDao.getAllReport(map, pageInfo);
		
		model.addAttribute("lists", lists);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("number", number);
		
		
		return viewPage;
	}
	
}
