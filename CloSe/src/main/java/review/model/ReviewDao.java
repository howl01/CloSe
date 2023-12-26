package review.model;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cart.model.CartInfoBean;
import utility.Paging_review;

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

	public List<ReviewItem> getReviewByProduct_number(Paging_review pageInfo, String product_number) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		return sqlSessionTemplate.selectList(namespace+".getReviewByProduct_number", product_number);
	}

	public int getTotalCount(String product_number) {
		return sqlSessionTemplate.selectOne(namespace+".getTotalCount",product_number);
	}
	
	
}
