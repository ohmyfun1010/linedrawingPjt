package kr.co.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.beans.BoardInfoBean;
@Repository
public class TopMenuDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BoardInfoBean> gettopmenulist()
	{
		return sqlSessionTemplate.selectList("topmenu.gettopmenulist");
	}
}
