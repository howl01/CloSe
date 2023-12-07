package qna.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("QnaDao")
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "qna.QnaBean";
	
}
