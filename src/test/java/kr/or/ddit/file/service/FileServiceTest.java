package kr.or.ddit.file.service;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import kr.or.ddit.file.model.File;

public class FileServiceTest {

	private IFileService fileService;
	
	@Before
	public void setUp() throws Exception {
		fileService = new FileService();
	}

	@After
	public void tearDown() throws Exception {
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
		File file = new File(900, "테스트", "테스트", 2);

		/***When***/
//		int insertCnt = fileService.insertFile(file);

		/***Then***/
//		assertEquals(1, insertCnt);
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
		List<File> fileList = fileService.getFileList(postSeq);

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
		File file = fileService.getFile(fileSeq);

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
		int fileSeq = 40;

		/***When***/
//		int deleteCnt = fileService.deleteFile(fileSeq);

		/***Then***/
//		assertEquals(1, deleteCnt);
	}

}
