package kr.or.ddit.post.service;

import static org.junit.Assert.assertEquals;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.post.model.Post;

public class PostServiceTest {

	private IPostService postService;
	
	@Before
	public void setUp() throws Exception {
		postService = new PostService();
	}

	@After
	public void tearDown() throws Exception {
		
	}

	/**
	* Method : getPostPagingListTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : 게시글 페이징리스트 반환 테스트
	*/
	@Test
	public void getPostPagingListTest() {
		/***Given***/
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardSeq", "1");
		map.put("page", 1);
		map.put("pagesize", 10);
		String boardSeq = "1";
		
		/***When***/
		resultMap = postService.getPostPagingList(map);

		/***Then***/
		assertEquals(2, resultMap.size());
	}
	
	/**
	* Method : getPostTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : postSeq에 해당하는 게시글 반환 테스트
	*/
	@Test
	public void getPostTest() {
		/***Given***/
		int postSeq = 1;
		
		/***When***/
		Post post = postService.getPost(postSeq);

		/***Then***/
		assertEquals("첫번째 글입니다", post.getPostNm());
	}
	
	/**
	* Method : insertPostTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : 게시글 추가 테스트
	*/
	@Test
	public void insertPostTest() {
		/***Given***/
		Post post = new Post(72, 1, "테스트", "테스트", "brown", new Date(), new Date(), 1, 0, null);

		/***When***/
//		int insertCnt = postService.insertPost(post);

		/***Then***/
//		assertEquals(72, insertCnt);
	}
	
	/**
	* Method : deletePostTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : 게시글 삭제 테스트
	*/
	@Test
	public void deletePostTest() {
		/***Given***/
		
		/***When***/
//		int deleteCnt = postService.deletePost(72);

		/***Then***/
//		assertEquals(deleteCnt, 1);
	}
	
	/**
	* Method : updatePostTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : 게시글 수정 테스트
	*/
	@Test
	public void updatePostTest() {
		/***Given***/
		Post post = new Post(72, "변경테스트", "변경테스트", new Date());
		
		/***When***/
//		int updateCnt = postService.updatePost(post);

		/***Then***/
//		assertEquals(1, updateCnt);
	}

}
