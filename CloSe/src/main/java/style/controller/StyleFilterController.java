package style.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import style.model.StyleBean;
import style.model.StyleDao;

@Controller
public class StyleFilterController {

	private final String command = "styleFilter.style";
	private final String viewPage = "styleFilterView";

	@Autowired
	StyleDao stylDao;

	@RequestMapping(command)
	@ResponseBody
	public String styleFilter(@RequestParam(value = "seasonArray[]", required = false) List<String> seasonList,
			@RequestParam(value = "genderArray[]", required = false) List<String> genderList,
			@RequestParam(value = "styleArray[]", required = false) List<String> styleList,
			@RequestParam(value = "season", required = false) String season,
			@RequestParam(value = "gender", required = false) String gender,
			@RequestParam(value = "style", required = false) String style, @RequestParam("latString") String latString,
			@RequestParam("longString") String longString, Model model) {

		String apiUrl = "https://api.openweathermap.org/data/2.5/weather?lat=" + latString + "&lon=" + longString
				+ "&appid=27f0e2dcc40e953d16644b55e897423d&units=metric";

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

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("seasonLists", seasonList);
			map.put("genderLists", genderList);
			map.put("styleLists", styleList);

			List<StyleBean> lists = stylDao.styleFilter(map);

			model.addAttribute("lists", lists);
			model.addAttribute("latString", latString);
			model.addAttribute("longString", longString);

			System.out.println("전체 lists 크기: " + lists.size());

			// 전체 lists 크기 출력

			model.addAttribute("lists", lists);

			// 클릭 이벤트 처리 및 AJAX 호출
			String closeApiUrl = "/styleFilterView.style?temp=" + temp;
			System.out.println("Click Event: " + closeApiUrl);
			// 여기서 AJAX 호출로 대체할 부분을 구현하면 됩니다.

		} catch (IOException e) {
			e.printStackTrace();
		}

		return viewPage;

	}

}
