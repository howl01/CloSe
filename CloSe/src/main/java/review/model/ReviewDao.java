package review.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cart.model.CartInfoBean;

@Component("ReviewDao")
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "review.ReviewBean";
	
	public void registerReview(ReviewBean rb) {
		sqlSessionTemplate.insert(namespace+".registerReview", rb); 
	}

	public List<ReviewBean> getAllReview() {
		return sqlSessionTemplate.selectList(namespace+".getAllReview");
	}

	public List<ReviewItem> getReviewByProduct_number(String product_number) {
		return sqlSessionTemplate.selectList(namespace+".getReviewByProduct_number", product_number);
	}
	
	
}
