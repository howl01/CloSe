package qna.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import qna.model.QnaBean;
import qna.model.QnaDao;

@Controller
public class QnaInsertController {

	private final String command = "/insert.qna";
	private final String viewPage = "qnaInsertForm";
	private final String gotoPage = "redirect:/list.qna";
	
	@Autowired
	QnaDao qnaDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String insertForm() {
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String insert(@Valid QnaBean qnaBean,
							BindingResult bResult,
							HttpServletResponse response) throws IOException {
		
		if(bResult.hasErrors()) {
			return viewPage;
		}
		qnaBean.setWrite_date(new Timestamp(System.currentTimeMillis()));
		String uploadPath = servletContext.getRealPath("/resources/uploadQna/");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int cnt = qnaDao.insertQna(qnaBean);
		File destination = new File(uploadPath+File.separator+qnaBean.getImage());
		
		MultipartFile multi = qnaBean.getUpload();
		if(cnt == -1) {
			out.println("<script>alert('올바른 형식이 아닙니다.');</script>");
			out.flush();
			return viewPage;
		}
		try {
			multi.transferTo(destination);
			out.println("<script>window.opener.location.reload(); window.close();</script>");
			out.flush();
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return gotoPage;
	}
	
}
