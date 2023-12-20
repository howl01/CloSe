package orders.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.net.ssl.HttpsURLConnection;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller 
public class OrdersRefundController {
	
	private final String command = "/refund.orders";
	private final String viewPage = "";
	private final String gotoPage = "redirect:/view.main";
	
    @Autowired
    PaymentService paymentService;
    
	@RequestMapping(command)
	public String refund(@RequestParam("pageNumber")String pageNumber,
						@RequestParam("orders_id")String orders_id) throws IOException {
		
		System.out.println(orders_id);
		String token = paymentService.getToken();
		System.out.println(token);
		paymentService.payMentCancle(token, orders_id);
		
		return gotoPage;
	}
	
}
