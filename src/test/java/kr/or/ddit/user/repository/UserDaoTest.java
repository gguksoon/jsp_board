package kr.or.ddit.user.repository;

import static org.junit.Assert.assertEquals;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.user.model.User;
import kr.or.ddit.util.MybatisUtil;

public class UserDaoTest {

	private SqlSession ss;
	private IUserDao userDao;
	
	private static final Logger logger = LoggerFactory.getLogger(UserDaoTest.class);
	
	@Before
	public void setUp() throws Exception {
		ss = MybatisUtil.getSession();
		userDao = new UserDao();
	}

	@After
	public void tearDown() throws Exception {
		ss.close();
	}

	@Test
	public void getUser() {
		/***Given***/
		String userId = "brown";

		/***When***/
		User user = userDao.getUser(ss, userId);
		
		logger.debug("{}", user.toString());

		/***Then***/
		assertEquals("brown", user.getUserId());
		assertEquals("브라운", user.getUserNm());
	}

}
