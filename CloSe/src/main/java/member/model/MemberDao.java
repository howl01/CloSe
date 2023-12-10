package member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("MemberDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "member.MemberBean";
	
	public MemberDao() {
		
	}

	public int findId(String inputid) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".findId",inputid);
		
		return cnt;
	}

	public int findNick(String inputnick) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".findNick",inputnick);
		return cnt;
	}
	
	public void memberRegister(MemberBean mb) {
		sqlSessionTemplate.insert(namespace+".memberRegister",mb);
	}

	
	
}
