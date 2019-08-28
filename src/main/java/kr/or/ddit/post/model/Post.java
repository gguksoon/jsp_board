package kr.or.ddit.post.model;

import java.util.Date;

public class Post {
	private int postSeq;		// 게시글 번호
	private int boardSeq;    	// 게시판 번호
	private String postNm;      // 게시글 제목
	private String postContent; // 게시글 내용
	private String userId;      // 작성자
	private Date postRegDate; 	// 작성일시
	private Date postModDate; 	// 수정일시
	private int postStatus;  	// 삭제여부
	private int parentSeq;   	// 부모게시글번호
	
	public int getPostSeq() {
		return postSeq;
	}
	public void setPostSeq(int postSeq) {
		this.postSeq = postSeq;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getPostNm() {
		return postNm;
	}
	public void setPostNm(String postNm) {
		this.postNm = postNm;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getPostRegDate() {
		return postRegDate;
	}
	public void setPostRegDate(Date postRegDate) {
		this.postRegDate = postRegDate;
	}
	public Date getPostModDate() {
		return postModDate;
	}
	public void setPostModDate(Date postModDate) {
		this.postModDate = postModDate;
	}
	public int getPostStatus() {
		return postStatus;
	}
	public void setPostStatus(int postStatus) {
		this.postStatus = postStatus;
	}
	public int getParentSeq() {
		return parentSeq;
	}
	public void setParentSeq(int parentSeq) {
		this.parentSeq = parentSeq;
	}
	
	@Override
	public String toString() {
		return "Post [postSeq=" + postSeq + ", boardSeq=" + boardSeq + ", postNm=" + postNm + ", postContent="
				+ postContent + ", userId=" + userId + ", postRegDate=" + postRegDate + ", postModDate=" + postModDate
				+ ", postStatus=" + postStatus + ", parentSeq=" + parentSeq + "]";
	}
}
