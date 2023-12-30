package style.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("LikeDao")
public class HeartDao {
   
   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   private String namespace = "heart.HeartBean";


	public void heart(HeartBean heartBean) {
		sqlSessionTemplate.insert(namespace + ".heart", heartBean);
	}


	public void unheart(HeartBean heartBean) {
		sqlSessionTemplate.delete(namespace + ".unheart", heartBean);
	}
   
}
