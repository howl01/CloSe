package member.model;

import java.util.Map;
import java.util.List;

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

	public MemberDao() {

	}

	public int findId(String inputid) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".findId", inputid);

		return cnt;
	}

	public int findNick(String inputnick) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".findNick", inputnick);
		return cnt;
	}

	public void memberRegister(MemberBean mb) {
		sqlSessionTemplate.insert(namespace + ".memberRegister", mb);
	}

	public void kakaoRegister(MemberBean mb) {
		sqlSessionTemplate.insert(namespace + ".kakaoRegister", mb);
	}

	public MemberBean getDetail(String member_id) {
		MemberBean memberBean = sqlSessionTemplate.selectOne(namespace + ".getDetail", member_id);

		return memberBean;
	}

	public MemberBean findwithName(String name) {
		MemberBean memberBean = sqlSessionTemplate.selectOne(namespace + ".findwithName", name);

		return memberBean;
	}

	public MemberBean findwithId(String member_id) {
		MemberBean memberBean = sqlSessionTemplate.selectOne(namespace + ".findwithId", member_id);

		return memberBean;
	}

	public MemberBean findwithNameAndPhone(Map<String, String> params) {
		MemberBean memberBean = sqlSessionTemplate.selectOne(namespace + ".findwithNameAndPhone", params);

		return memberBean;
	}

	public void memberUpdate(MemberBean memberBean) {
		sqlSessionTemplate.update(namespace + ".memberUpdate", memberBean);
	}

	public void memberDelete(String member_id) {
		sqlSessionTemplate.delete(namespace + ".memberDelete", member_id);
	}

	public MemberBean getMember(String member_id) {
		MemberBean memberBean = sqlSessionTemplate.selectOne(namespace + ".getMember", member_id);
		return memberBean;
	}

}
