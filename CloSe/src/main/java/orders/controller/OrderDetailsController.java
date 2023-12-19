package orders.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import orderdetail.model.OrderItem;
import orderdetail.model.OrdersDetailDao;
import orders.model.OrdersDao;

//주문상세내역
@Controller
public class OrderDetailsController {
	private final String command = "/detail.orders";
	private final String viewPage = "orderDetail";
	private final String gotoPage = "";
	
	
	@Autowired
	OrdersDao ordersDao;
	
	@Autowired
	OrdersDetailDao ordersDetailDao;
	
	@RequestMapping(value=command)
	public String orderDetails(@RequestParam("orders_id")String orders_id,
								Model model) {
		
		List<OrderItem> olists = ordersDetailDao.getOrderDetailsByOrder_id(orders_id);
		
		model.addAttribute("olists", olists);
		return viewPage;
	}
}
