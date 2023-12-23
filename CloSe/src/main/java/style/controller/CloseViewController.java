package style.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import style.model.StyleBean;
import style.model.StyleDao;

@Controller
public class CloseViewController {

	private final String command = "/view.style";
	private final String viewPage = "close";

	public String latString = "";
	public String longString = "";

	@Autowired
	StyleDao styleDao;

	// 현재 위치좌표 받아오기
	@RequestMapping(value = command, method = RequestMethod.POST)
	public void temp(@RequestParam("latitude") double latitude, @RequestParam("longitude") double longitude) {
		System.out.println("Latitude: " + latitude);
		System.out.println("Longitude: " + longitude);

		String latString = String.valueOf(latitude);
		String longString = String.valueOf(longitude);

		this.latString = latString;
		this.longString = longString;
	}

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String close(Model model) {

		System.out.println("latString: " + latString);
		System.out.println("longString: " + longString);

		String apiUrl = "";
		if (latString == null || longString == null) {
			apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=27f0e2dcc40e953d16644b55e897423d&units=metric";
		} else {
			apiUrl = "https://api.openweathermap.org/data/2.5/weather?lat=" + latString + "&lon=" + longString
					+ "&appid=27f0e2dcc40e953d16644b55e897423d&units=metric";
		}
		try {

			// OpenWeatherMap API 요청
			apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=27f0e2dcc40e953d16644b55e897423d&units=metric";
			URL url = new URL(apiUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");

			System.out.println("apiUrl : " + apiUrl);

			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			StringBuilder response = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				response.append(line);
			}
			reader.close();
			connection.disconnect();
			// JSON 데이터 파싱
			JSONObject result = new JSONObject(response.toString());
			// 날씨 정보 출력
			double temp = result.getJSONObject("main").getDouble("temp");
			double feelTemperature = result.getJSONObject("main").getDouble("feels_like");
			long dt = result.getLong("dt");

			Date ot = new Date(dt * 1000);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 기준");
			String currentTime = sdf.format(ot);

			System.out.println("temp : " + temp + "°C");
			System.out.println("feelTemperature : " + feelTemperature + "°C");
			System.out.println("currentTime : " + currentTime);
			model.addAttribute("temp", temp);
			model.addAttribute("feelTemperature", feelTemperature);
			model.addAttribute("currentTime", currentTime);
			model.addAttribute("latString", latString);
			model.addAttribute("longString", longString);

			// 추가: 이미지 URL 및 설명을 모델에 추가
			String wiconUrl = "http://openweathermap.org/img/wn/"
					+ result.getJSONArray("weather").getJSONObject(0).getString("icon") + ".png";
			String description = result.getJSONArray("weather").getJSONObject(0).getString("description");

			model.addAttribute("wiconUrl", wiconUrl);
			model.addAttribute("description", description);

			Map<String, Double> map = new HashMap<String, Double>();
			map.put("temp", temp);

			List<StyleBean> lists = styleDao.getTemperatureByStyle(map);

			System.out.println("전체 lists 크기: " + lists.size());

			// 전체 lists 크기 출력

			model.addAttribute("lists", lists);

			// 클릭 이벤트 처리 및 AJAX 호출
			String closeApiUrl = "/view.style?temp=" + temp;
			System.out.println("Click Event: " + closeApiUrl);
			// 여기서 AJAX 호출로 대체할 부분을 구현하면 됩니다.

		} catch (IOException e) {
			e.printStackTrace();
		}

		return viewPage;

	}
}