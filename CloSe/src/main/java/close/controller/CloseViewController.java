package close.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import style.model.StyleBean;
import style.model.StyleDao;

@Controller
public class CloseViewController {

   private final String command = "/view.close";
   private final String viewPage = "close";
   
   @Autowired
   StyleDao styleDao;
   
   @RequestMapping(value = command, method = RequestMethod.GET)
   public String close(Model model) throws IOException {
      
      // 오늘 날짜 가져오기
       LocalDate today = LocalDate.now();
       DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
       String formattedDate = today.format(formatter);
       //현재 시간 가져오기
       LocalTime now = LocalTime.now();
       DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("HH00");
       String formattedTime = now.format(formatter2);
       
       System.out.println("formattedDate : " + formattedDate);

      StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"); /*URL*/
       urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=LXEf5efL3eVwUeG%2FfsUPd%2Bzm5GefA3q09J2myi5bIisYdACpRWqvMdvB8xQjRacuAFJpp6l1EqjgXb%2BvGOA1ZA%3D%3D"); /*Service Key*/
       urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
       urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
       urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
       urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(formattedDate, "UTF-8")); /*‘21년 6월 28일발표*/
       urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("0200", "UTF-8")); /*02시 발표*/
       urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("55", "UTF-8")); /*예보지점의 X 좌표값*/
       urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode("127", "UTF-8")); /*예보지점의 Y 좌표값*/
       URL url = new URL(urlBuilder.toString());
       HttpURLConnection conn = (HttpURLConnection) url.openConnection();
       conn.setRequestMethod("GET");
       conn.setRequestProperty("Content-type", "application/json");
       System.out.println("Response code: " + conn.getResponseCode());
       BufferedReader rd;
       if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
           rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
       } else {
           rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
       }
       StringBuilder sb = new StringBuilder();
       String line;
       while ((line = rd.readLine()) != null) {
           sb.append(line);
       }
       rd.close();
       conn.disconnect();
       String data= sb.toString();
       
       System.out.println(data);
       
    // JSON 데이터 파싱
       JSONObject jsonData = new JSONObject(data);
       JSONObject response = jsonData.getJSONObject("response");
       JSONObject body = response.getJSONObject("body");
       JSONObject items = body.getJSONObject("items");
       JSONArray itemList = items.getJSONArray("item");

       double sum = 0;
       
       // 아이템을 순회하며 TMN 및 TMX 값을 찾기
       for (int i = 0; i < itemList.length(); i++) {
           JSONObject item = itemList.getJSONObject(i);
           String category = item.getString("category");
           String fcstDate = item.getString("fcstDate");
           String fcstTime = item.getString("fcstTime");
           if("TMN".equals(category) && formattedDate.equals(fcstDate)) {
        	   String fcstValue = item.getString("fcstValue");
        	   sum = sum + Double.parseDouble(fcstValue);
        	   System.out.println("최저 기온 (TMN): " + fcstValue);
        	   model.addAttribute("TMNValue", fcstValue);
           }else if("TMX".equals(category) && formattedDate.equals(fcstDate)) {
        	   String fcstValue = item.getString("fcstValue");
        	   sum = sum + Double.parseDouble(fcstValue);
    		   System.out.println("최고 기온 (TMX): " + fcstValue);
               model.addAttribute("TMXValue", fcstValue);
           }else if("SKY".equals(category) && formattedDate.equals(fcstDate) && formattedTime.equals(fcstTime)) {
              String fcstValue = item.getString("fcstValue");
              if(fcstValue.equals("1")) {
                 System.out.println("현재 날씨 : 맑음");
              }else if(fcstValue.equals("2")){
                 System.out.println("현재 날씨 : 비");
              }else if(fcstValue.equals("3")) {
                 System.out.println("현재 날씨 : 구름 많음");
              }else if(fcstValue.equals("4")) {
                 System.out.println("현재 날씨 : 흐림");
              }
              
           }
       }

       System.out.println("sum : " + sum);
       
       double avg = (sum / 2);
       
       String season;
       
       if(avg <= 4.0) {
    	   season = "winter";
       }else if(avg > 4.0 && avg <= 8.0) {
    	   season = "earlyWinter";
       }else if(avg > 8.0 && avg <= 12.0) {
    	   season = "fall";
       }else if(avg > 12.0 && avg <= 16.0) {
    	   season = "earlySpring";
       }else if(avg > 16.0 && avg <= 19.0) {
    	   season = "earlyFall";
       }else if(avg > 19.0 && avg <= 22.0) {
    	   season = "Spring";
       }else if(avg > 22.0 && avg <= 27.0) {
    	   season = "earlySummer";
       }else if(avg > 27.0) {
    	   season = "summer";
       }
       
       List<StyleBean> lists = styleDao.getTemperatureAvgByStyle();
       
       return viewPage;
   }
   
}