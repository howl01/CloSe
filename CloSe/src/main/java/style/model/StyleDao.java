package style.model;

import java.util.List;

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

	public List<StyleBean> getStyleList() {
		return sqlSessionTemplate.selectList(namespace + ".getStyleList");
	}

	public StyleBean getStyleByStyleNumber(int style_number) {
		return sqlSessionTemplate.selectOne(namespace + ".getStyleByStyleNumber", style_number);
	}

}
