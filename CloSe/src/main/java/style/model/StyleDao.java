package style.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("StyleDao")
public class StyleDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "style.StyleBean";
	
	public int insertStyle(StyleBean styleBean) {
		int cnt = -1;
		try {
			cnt = sqlSessionTemplate.insert(namespace + ".insertStyle", styleBean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
