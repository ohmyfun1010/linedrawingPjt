package kr.co.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.beans.UserBean;

@Repository
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public String checkUserIdExist(String user_id)
	{
		return sqlSessionTemplate.selectOne("user.checkUserIdExist",user_id);
	}
	public void addUserInfo(UserBean joinUserBean)
	{
		sqlSessionTemplate.insert("user.addUserInfo",joinUserBean);
	}
	public UserBean getLoginUserInfo(UserBean tempLoginUserBean)
	{
		return sqlSessionTemplate.selectOne("user.getLoginUserInfo",tempLoginUserBean);
	}
	public UserBean userinfo(int user_idx)
	{
		return sqlSessionTemplate.selectOne("user.userinfo",user_idx);
	}
	public void userinfodelete(int user_idx)
	{
		sqlSessionTemplate.delete("user.userinfodelete",user_idx);
	}
	public void userinfomodify(UserBean userBean)
	{
		sqlSessionTemplate.update("user.userinfomodify",userBean);
	}
	
}
