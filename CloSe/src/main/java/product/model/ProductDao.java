package product.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cart.model.CartInfoBean;

@Component("ProductDao")
public class ProductDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "product.ProductBean";
	
	public List<ProductBean> getAllProduct() {
		Integer count = sqlSessionTemplate.selectOne(namespace+".getKeywordCount", "keyword");

        if (count == null) {
            // 키워드가 존재하지 않으면 추가
        	sqlSessionTemplate.insert(namespace + ".insertKeyword" , "keyword");
        } else {
            // 키워드가 이미 존재하면 카운트 업데이트
        	sqlSessionTemplate.update(namespace + ".updateKeywordCount" , "keyword");
        }
        
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

	public void updateStock(CartInfoBean cib) {
		sqlSessionTemplate.update(namespace+".updateStock", cib);
	}

	public void deleteProduct(String product_number) {
		sqlSessionTemplate.delete(namespace+".deleteProduct", product_number); 
	}

	public void updateProduct(ProductBean pb) {
		sqlSessionTemplate.update(namespace+".updateProduct", pb);
	}
	public List<String> findProductNames(String searchWord) {
		return sqlSessionTemplate.selectList(namespace + ".findProductNames", searchWord);
	}
	public List<ProductBean> findProductNames2(String searchWord2) {
		return sqlSessionTemplate.selectList(namespace + ".findProductNames2", searchWord2);
	}

	public List<ProductBean> getPop() {
		return sqlSessionTemplate.selectList(namespace + ".getPop");
	}
	
}
