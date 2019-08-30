package kr.or.ddit.board;

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
		assertEquals("게시판1", board.getBoardNm());
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
		assertEquals(5, boardList.size());
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
	public void insertBoardTest() {
		/***Given***/
		Board board = new Board(0, "테스트용게시판", "아이디", 0, 1);

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
	public void updateBoardTest() {
		
	}
	
	/**
	* Method : deleteBoard
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* @param ss
	* @param boardSeq
	* @return
	* Method 설명 : 게시판 삭제 Test
	*/
	public void deleteBoardTest() {
		
	}

}
