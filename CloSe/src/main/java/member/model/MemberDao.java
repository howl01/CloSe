package member.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("MemberDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "member.MemberBean";
	
	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getTotalCount", map);
		return cnt;
	}

	public List<MemberBean> getAllMemebr(Map<String, String> map, Paging pageInfo) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<MemberBean> lists = sqlSessionTemplate.selectList(namespace+".getAllMemebr", map, rowbounds);
		return lists;
	}

	public MemberBean getMember(String member_id) {
		MemberBean memberBean = sqlSessionTemplate.selectOne(namespace+".getMember", member_id);
		return memberBean;
	}

	public int updateMemberBan(MemberBean memberBean) {
		int cnt = -1;
		try {
			cnt = sqlSessionTemplate.update(namespace+".updateMemberBan", memberBean);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
}
