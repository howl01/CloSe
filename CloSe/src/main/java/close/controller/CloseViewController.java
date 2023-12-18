package close.controller;

import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CloseViewController {

	private final String command = "/view.close";
	private final String viewPage = "close";
	
	@RequestMapping(command)
	public String close(@RequestParam(value = "openWeatherTemperature", required = false) Optional<Integer> openWeatherTemperature,
						Model model) {
		try {
			if(openWeatherTemperature.isPresent()) {
				System.out.println("openWeatherTemperature : " + openWeatherTemperature);
				model.addAttribute("openWeatherTemperature", openWeatherTemperature);
			}else {
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}
	
}
