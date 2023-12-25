package product.model;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cart.model.CartInfoBean;
import utility.Paging_productList;

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

	public List<ProductBean> getProductByBigcategory(String bigcategory_name, Paging_productList pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace+".getProductByBigcategory",bigcategory_name,rowBounds);
	}
	public List<ProductBean> getProductBySmallcategory(String smallcategory_name, Paging_productList pageInfo) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace+".getProductBySmallcategory",smallcategory_name,rowBounds);
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

	public int getCountByBigcategory(String bigcategory_name) {
		return sqlSessionTemplate.selectOne(namespace+".getCountByBigcategory", bigcategory_name);
	}

	public int getCountBySmallcategory(String smallcategory_name) {
		return sqlSessionTemplate.selectOne(namespace+".getCountBySmallcategory", smallcategory_name);
	}
	
}
