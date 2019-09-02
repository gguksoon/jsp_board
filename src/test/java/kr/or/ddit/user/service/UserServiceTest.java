package kr.or.ddit.user.service;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import kr.or.ddit.user.model.User;

public class UserServiceTest {

	private IUserService userService;
	
	@Before
	public void setUp() throws Exception {
		userService = new UserService();
	}

	@After
	public void tearDown() throws Exception {
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
		User user = userService.getUser(userId);

		/***Then***/
		assertEquals("브라운", user.getUserNm());
		assertEquals("곰", user.getAlias());
	}

}
