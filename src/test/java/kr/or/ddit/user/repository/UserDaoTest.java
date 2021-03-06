package kr.or.ddit.user.repository;

import static org.junit.Assert.assertEquals;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.user.model.User;
import kr.or.ddit.util.MybatisUtil;

public class UserDaoTest {

	private SqlSession ss;
	private IUserDao userDao;
	
	@Before
	public void setUp() throws Exception {
		userDao = new UserDao();
		ss = MybatisUtil.getSession();
	}
	
	@After
	public void tearDown() throws Exception {
		ss.close();
	}

	/**
	* Method : getUserTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : userId에 해당하는 user객체 반환 테스트
	*/
	@Test
	public void getUserTest() {
		/***Given***/
		String userId = "brown";

		/***When***/
		User user = userDao.getUser(ss, userId);

		/***Then***/
		assertEquals("브라운", user.getUserNm());
		assertEquals("곰", user.getAlias());
	}

}
