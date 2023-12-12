package product.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("ProductDao")
public class ProductDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "product.ProductBean";
	
	public List<ProductBean> getAllProduct() {
		return sqlSessionTemplate.selectList(namespace+".getAllProduct");
	}

	public void insertProduct(ProductBean pb) {
		sqlSessionTemplate.insert(namespace+".insertProduct",pb);
	}

	public ProductBean getOneProduct(String product_number) {
		return sqlSessionTemplate.selectOne(namespace+".getOneProduct",product_number);
	}

	public List<ProductBean> getProductByBigcategory(String bigcategory_name) {
		return sqlSessionTemplate.selectList(namespace+".getProductByBigcategory",bigcategory_name);
	}
	
}
