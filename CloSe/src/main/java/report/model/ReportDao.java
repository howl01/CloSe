package report.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("ReportDao")
public class ReportDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "report.ReportBean";
	
	public ReportDao() {
		
	}

	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".getTotalCount", map);
		return cnt;
	}

	public List<ReportBean> getAllReport(Map<String, String> map, Paging pageInfo) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<ReportBean> lists = sqlSessionTemplate.selectList(namespace+".getAllReport", map, rowbounds);
		return lists;
	}

	public ReportBean getDetailReport(String report_number) {
		ReportBean reportBean = sqlSessionTemplate.selectOne(namespace+".getDetailReport", report_number);
		return reportBean;
	}
	
	
	
}
