package orders.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("OrdersDao")
public class OrdersDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "orders.OrdersBean";
	
}
