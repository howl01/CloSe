package popular.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("PopularDao")
public class PopularDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "popular.PopularBean";
	
	public List<PopularBean> getAllPopular() {
		return sqlSessionTemplate.selectList(namespace + ".getAllPopular");
	}
}
