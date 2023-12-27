package style.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import style.model.StyleBean;
import style.model.StyleDao;

@Controller
public class StyleFilterController {
	
	private final String command = "/styleFilter.style";
	
	@Autowired
	private StyleDao styleDao;
	
	@RequestMapping(command)
	@ResponseBody
	public ResponseEntity<org.json.simple.JSONArray> styleFilter(
	        @RequestParam(value = "seasonArray", required = false) List<String> seasonLists,
	        @RequestParam(value = "genderArray", required = false) List<String> genderLists,
	        @RequestParam(value = "styleArray", required = false) List<String> styleLists,
	        @RequestParam(value = "temp", required = false) String temp,
	        Model model) {
		
		if(seasonLists != null) {
			for(String z : seasonLists) {
				System.out.println("z : " + z);
			}
		}
		if(genderLists != null) {
			for(String x : genderLists) {
				System.out.println("x : " + x);
			}
		}
		if(styleLists != null) {
			for(String y : styleLists) {
				System.out.println("y : " + y);
			}
		}
		
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("seasonLists", seasonLists);
	    map.put("genderLists", genderLists);
	    map.put("styleLists", styleLists);
	    map.put("temp", temp);

	    List<StyleBean> lists = styleDao.styleFilter(map);

	    System.out.println("전체 lists 크기: " + lists.size());

	    org.json.simple.JSONArray jsonArr = new org.json.simple.JSONArray();
	    for(StyleBean styleBean : lists) {
	    	System.out.println("title : " + styleBean.getTitle());
	    	System.out.println("style_number : " + styleBean.getStyle_number());
	        org.json.simple.JSONObject jsonObj = new org.json.simple.JSONObject();
	        jsonObj.put("style_number", styleBean.getStyle_number());
	        jsonObj.put("avg_temperature", styleBean.getAvg_temperature());
	        jsonObj.put("image1", styleBean.getImage1());
	        jsonObj.put("title", styleBean.getTitle());
	        jsonObj.put("style", styleBean.getStyle());
	        jsonObj.put("member_id", styleBean.getMember_id());
	        jsonObj.put("nickname", styleBean.getNickname());
	        jsonObj.put("gender", styleBean.getGender());
	        jsonArr.add(jsonObj);
	    }
	    
	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    return new ResponseEntity<org.json.simple.JSONArray>(jsonArr, headers, HttpStatus.OK);
	}
}
