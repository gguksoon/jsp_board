package kr.or.ddit.user.repository;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.user.model.User;

public class UserDao implements IUserDao {

	/**
	* Method : getUser
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* @param ss
	* @param userId
	* @return
	* Method 설명 : userId에 해당하는 user객체 반환
	*/
	@Override
	public User getUser(SqlSession ss, String userId) {
		return ss.selectOne("user.getUser", userId);
	}

}
