package kr.or.ddit.board.repository;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.board.model.Board;
import kr.or.ddit.board.repository.BoardDao;
import kr.or.ddit.board.repository.IBoardDao;
import kr.or.ddit.util.MybatisUtil;

public class BoardDaoTest {

	private SqlSession ss;
	private IBoardDao boardDao;
	
	@Before
	public void setUp() throws Exception {
		ss = MybatisUtil.getSession();
		boardDao = new BoardDao();
	}

	@After
	public void tearDown() throws Exception {
		ss.close();
	}

	/**
	* Method : getBoardTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : boardSeq에 해당하는 board객체 반환 Test
	*/
	@Test
	public void getBoardTest() {
		/***Given***/
		String boardSeq = "1";

		/***When***/
		Board board = boardDao.getBoard(ss, boardSeq);

		/***Then***/
		assertEquals("첫번째 게시판", board.getBoardNm());
	}
	
	/**
	* Method : getBoardLocation
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : boardLocation에 해당하는 board객체 반환 
	*/
	@Test
	public void getBoardLocationTest() {
		/***Given***/
		int boardLocation = 1;

		/***When***/
		Board board = boardDao.getBoardLocation(ss, boardLocation);

		/***Then***/
		assertEquals("첫번째 게시판", board.getBoardNm());
	}
	
	/**
	* Method : getBoardListTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : 전체 board객체 반환 Test 
	*/
	@Test
	public void getBoardListTest() {
		/***Given***/

		/***When***/
		List<Board> boardList = boardDao.getBoardList(ss);

		/***Then***/
		assertEquals(11, boardList.size());
	}
	
	/**
	* Method : insertBoard
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* @param ss
	* @param board
	* @return
	* Method 설명 : 게시판 추가 Test
	*/
	@Test
	public void insertBoardTest() {
		/***Given***/
		Board board = new Board(10000, "테스트용게시판", "brown", 0, 1);

		/***When***/
		int insertCnt = boardDao.insertBoard(ss, board);

		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	/**
	* Method : updateBoard
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* @param ss
	* @param board
	* @return
	* Method 설명 : 게시판 수정 Test
	*/
	@Test
	public void updateBoardTest() {
		/***Given***/
		Board board = new Board(1, "테스트용게시판", "brown", 0, 1);
		
		/***When***/
		int updateCnt = boardDao.updateBoard(ss, board);

		/***Then***/
		assertEquals(1, updateCnt);
	}
	
}
