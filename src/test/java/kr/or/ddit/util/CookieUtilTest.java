package kr.or.ddit.util;

import static org.junit.Assert.*;

import org.junit.Test;

public class CookieUtilTest {

	/**
	* Method : getCookieTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : 쿠키 가져오기 테스트
	*/
	@Test
	public void getCookieTest() {
		/***Given***/
		String cookieString = "userId=brown; rememberMe=Y; test=testValue";

		/***When***/
		String cookieValue = CookieUtil.getCookie(cookieString, "userId");
		String rememberMeCookieValue = CookieUtil.getCookie(cookieString, "rememberMe");
		String testCookieValue = CookieUtil.getCookie(cookieString, "test");
		String notExistsCookieValue = CookieUtil.getCookie(cookieString, "notExists");

		/***Then***/
		assertEquals("brown", cookieValue);
		assertEquals("Y", rememberMeCookieValue);
		assertEquals("testValue", testCookieValue);
		assertNull(notExistsCookieValue);
	}

}
