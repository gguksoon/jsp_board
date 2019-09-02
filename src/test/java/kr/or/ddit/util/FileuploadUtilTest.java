package kr.or.ddit.util;

import static org.junit.Assert.*;

import org.junit.Test;

public class FileuploadUtilTest {

	/**
	* Method : getFilenameTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : Content-disposition 헤더 문자열로 부터 파일이름 추출 테스트 
	*/
	@Test
	public void getFilenameTest() {
		/***Given***/
		String contentDisposition = "form-data; name=\"file\"; filename=\"cony.png\"";
		String contentDisposition2 = "form-data; name=\"file\"; filename=\"brown.png\"";

		/***When***/
		String filename = FileuploadUtil.getFilename(contentDisposition);
		String filename2 = FileuploadUtil.getFilename(contentDisposition2);

		/***Then***/
		assertEquals("cony.png", filename);
		assertEquals("brown.png", filename2);
	}
	
	/**
	* Method : getFileExtensionTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : Content-disposition 헤더 문자열로 부터 파일확장자 추출 테스트 
	*/
	@Test
	public void getFileExtensionTest() {
		/***Given***/
		String contentDisposition = "form-data; name=\"file\"; filename=\"cony.png\"";
		String contentDisposition2 = "form-data; name=\"file\"; filename=\"brown.png\"";
		String contentDisposition3 = "form-data; name=\"file\"; filename=\"moon\"";
		String contentDisposition4 = "form-data; name=\"file\"; filename=\"moon.xx.jpg\"";

		/***When***/
		String fileExtension = FileuploadUtil.getFileExtension(contentDisposition);
		String fileExtension2 = FileuploadUtil.getFileExtension(contentDisposition2);
		String fileExtension3 = FileuploadUtil.getFileExtension(contentDisposition3);
		String fileExtension4 = FileuploadUtil.getFileExtension(contentDisposition4);

		/***Then***/
		assertEquals(".png", fileExtension);
		assertEquals(".png", fileExtension2);
		assertEquals("", fileExtension3);
		assertEquals(".jpg", fileExtension4);
	}
	
	/**
	* Method : getPathTest
	* 작성자 : Jo Min-Soo
	* 변경이력 :
	* Method 설명 : 파일 업로드 경로 조회하기 테스트 
	*/
	public void getPathTest() {
		/***Given***/

		/***When***/
		String path = FileuploadUtil.getPath(); 

		/***Then***/
		assertEquals("e:\\upload\\2019\\08\\", path);
	}

}
