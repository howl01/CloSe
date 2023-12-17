package style.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import style.model.StyleBean;
import style.model.StyleDao;

@Controller
public class StyleInsertController {

	private final String command = "insert.style";
	private final String viewPage = "styleInsertForm";
	private final String gotoPage = "redirect:/mainView.style";

	@Autowired
	ServletContext servletContext;

	@Autowired
	private StyleDao styleDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String insertForm(HttpSession session) {
		session.setAttribute("member_id", "kim");
		return viewPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String insert(@Valid StyleBean styleBean, BindingResult result, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		if (result.hasErrors()) {
			return viewPage;
		}

		String path = servletContext.getRealPath("/resources/styleImage");
		
		// 폴더가 없으면 생성
	    File directory = new File(path);
	    if (!directory.exists()) {
	        directory.mkdirs(); // 디렉토리 생성
	    }
		
		List<MultipartFile> images = styleBean.getImages();
		for (int i = 0; i < images.size(); i++) {

			MultipartFile image = images.get(i);
			String imageName = image.getOriginalFilename();
			String uniqueFilename = generateUniqueFilename(imageName);

			File uploadImage = new File(path + File.separator + uniqueFilename);
			try {
				image.transferTo(uploadImage);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		int cnt = styleDao.insertStyle(styleBean);
		if(cnt == -1) {
			try {
				response.getWriter().append("<script>alert('글 등록 실패');location.href='"+viewPage+";'</script>");
				response.getWriter().flush();
			} catch (IOException e) {
				e.printStackTrace();
			} 
		} else {
			try {
				response.getWriter().append("<script>alert('글 등록 성공');location.href='"+gotoPage+";'</script>");
				response.getWriter().flush();
			} catch (IOException e) {
				e.printStackTrace();
			} 
		}
		return gotoPage;
	}
	
	private String generateUniqueFilename(String imageName) {
	    String[] parts = imageName.split("\\.");
	    String extension = parts[parts.length - 1];
	    String uniqueName = System.currentTimeMillis() + "_" + java.util.UUID.randomUUID().toString() + "." + extension;
	    return uniqueName;
	}
}
