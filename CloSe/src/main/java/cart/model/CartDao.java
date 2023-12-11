package cart.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("CartDao")
public class CartDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "cart.CartBean";
	
	
	public void addCart(CartBean cb) {
		sqlSessionTemplate.insert(namespace+".addCart", cb);
	}


	public List<CartBean> getAllCartByMember_Id(String member_id) {
		return sqlSessionTemplate.selectList(namespace+".getAllCartByMember_Id", member_id);
	}


	
}
