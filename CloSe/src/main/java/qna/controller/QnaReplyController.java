package qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import qna.model.QnaBean;
import qna.model.QnaDao;
import utility.Paging;

@Controller
public class QnaReplyController {

	private final String command = "/reply.qna";
	private final String viewPage = "qnaReplyForm";
	private final String gotoPage = "redirect:/list.qna";

	@Autowired
	QnaDao qnaDao;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String replyForm(@RequestParam("ref") int ref,
								@RequestParam("pageNumber") String pageNumber,
								@RequestParam("qna_number") String qna_number,
								@RequestParam(value = "whatColumn", required = false) String whatColumn,
								@RequestParam(value = "keyword", required = false) String keyword,
								HttpServletRequest request,
								Model model) {
		
		 Map<String, String> map = new HashMap<String, String>();
		 map.put("whatColumn", whatColumn); 
		 map.put("keyword", "%"+keyword+"%");
		 
		 int totalCount = qnaDao.getTotalCount(map);
		 String url = request.getContextPath() + command;
		 
		 Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword);
		 
		 map.put("begin", String.valueOf(pageInfo.getBeginRow())); 
		 map.put("end", String.valueOf(pageInfo.getEndRow()));
		 
		 int number = totalCount - (pageInfo.getPageNumber() -1) * 10;
		 
		 List<QnaBean> lists = qnaDao.getAllQna(map, pageInfo);
		 QnaBean qnaBean = qnaDao.selectQna(qna_number);
		 
		 model.addAttribute("pageNumber", pageNumber);
		 model.addAttribute("qna_number", qna_number);
		 model.addAttribute("lists", lists);
		 model.addAttribute("pageInfo", pageInfo);
		 model.addAttribute("number", number);
		 model.addAttribute("content", qnaBean.getContent());
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String reply(@Valid QnaBean qnaBean,
							BindingResult bResult,
							@RequestParam("pageNumber") String pageNumber,
							HttpServletResponse response,
							Model model) throws IOException {
		if(bResult.hasErrors()) {
			model.addAttribute("ref", qnaBean.getRef());
			model.addAttribute("pageNumber", pageNumber);
			return viewPage;
		}
		qnaBean.setWrite_date(new Timestamp(System.currentTimeMillis()));
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int cnt = qnaDao.replyQna(qnaBean);
		
		if(cnt == -1) {
			out.println("<script>alert('올바른 형식이 아닙니다.');</script>");
			out.flush();
			model.addAttribute("ref", qnaBean.getRef());
			model.addAttribute("pageNumber", pageNumber);
			return viewPage;
		}
		
		model.addAttribute("pageNumber", pageNumber);
		return gotoPage;
	}
	
}
