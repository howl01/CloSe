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

	public List<StyleBean> getTemperatureByStyle(double temperature) {
		 List<StyleBean> lists = sqlSessionTemplate.selectList(namespace+".getTemperatureByStyle", temperature);
		 System.out.println("lists size : " + lists.size());
	     return lists;
	   }

	public String selectMember(int style_number) {
		String reported_user_id = sqlSessionTemplate.selectOne(namespace+".selectMember", style_number);
		return reported_user_id;
	}

	public List<StyleBean> selectTempStyle() {
		List<StyleBean> tempLists = sqlSessionTemplate.selectList(namespace+".selectTempStyle");
		System.out.println("tempLists : " + tempLists);
		return tempLists;
	}

	
}
