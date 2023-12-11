package main.model;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import product.model.ProductDao;

@Controller
public class SearchController {
	@Autowired
    private ProductDao productService;
	
	@RequestMapping("/search.main")
    public String showSearchPage() {
        return "search"; // JSP 파일명과 일치해야 합니다.
    }

    @RequestMapping(value = "/wordSearchShow.main", method = RequestMethod.GET)
    @ResponseBody
    public void wordSearchShow(@RequestParam("searchWord") String searchWord, HttpServletResponse response) throws IOException {
    	List<String> wordList =  productService.findProductNames(searchWord);
        
        JSONArray jsonArr = new JSONArray(); 
		if(wordList != null) {
			for(String word : wordList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("word", word);			
				jsonArr.add(jsonObj);
			}
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.getWriter().append(jsonArr.toString());
    }
}
