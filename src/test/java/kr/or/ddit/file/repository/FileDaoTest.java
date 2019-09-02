package kr.or.ddit.file.repository;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.file.model.File;
import kr.or.ddit.util.MybatisUtil;

public class FileDaoTest {
	
	private SqlSession ss;
	private IFileDao fileDao; 

	@Before
	public void setUp() throws Exception {
		ss = MybatisUtil.getSession();
		fileDao = new FileDao();
	}

	@After
	public void tearDown() throws Exception {
		ss.close();
	}
	
	/**
	* Method : insertFileTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : 파일 추가 테스트
	*/
	@Test
	public void insertFileTest() {
		/***Given***/
		File file = new File(900, "테스트", "테스트", 1);

		/***When***/
		int insertCnt = fileDao.insertFile(ss, file);

		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	/**
	* Method : getFileListTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : postSeq에 해당하는 파일리스트 반환 테스트
	*/
	@Test
	public void getFileListTest() {
		/***Given***/
		int postSeq = 1;

		/***When***/
		List<File> fileList = fileDao.getFileList(ss, postSeq);

		/***Then***/
		assertEquals(5, fileList.size());
	}
	
	/**
	* Method : getFileTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : fileSeq에 해당하는 파일 반환 테스트
	*/
	@Test
	public void getFileTest() {
		/***Given***/
		int fileSeq = 16;

		/***When***/
		File file = fileDao.getFile(ss, fileSeq);

		/***Then***/
		assertEquals("james.png", file.getFileName());
	}
	
	/**
	* Method : deleteFileTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : fileSeq에 해당하는 파일 삭제 테스트
	*/
	@Test
	public void deleteFileTest() {
		/***Given***/
		int fileSeq = 24;

		/***When***/
		int deleteCnt = fileDao.deleteFile(ss, fileSeq);

		/***Then***/
		assertEquals(1, deleteCnt);
	}

}
