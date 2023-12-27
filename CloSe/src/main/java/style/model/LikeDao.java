package style.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("LikeDao")
public class LikeDao {
   
   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   private String namespace = "like.LikeBean";


	public void like(LikeBean likeBean) {
		sqlSessionTemplate.insert(namespace + ".like", likeBean);
	}
   
}
