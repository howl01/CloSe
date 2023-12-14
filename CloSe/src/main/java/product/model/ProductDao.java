package product.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("ProductDao")
public class ProductDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "product.ProductBean";
	
	public List<ProductBean> getAllProduct() {
		return sqlSessionTemplate.selectList(namespace+"getAllProduct");
	}

	public List<String> findProductNames(String searchWord) {
		return sqlSessionTemplate.selectList(namespace + ".findProductNames", searchWord);
	}

	public List<ProductBean> findProductNames2(String searchWord2) {
		return sqlSessionTemplate.selectList(namespace + ".findProductNames2", searchWord2);
	}
	
}
