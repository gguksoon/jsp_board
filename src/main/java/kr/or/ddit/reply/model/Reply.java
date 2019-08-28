package kr.or.ddit.reply.model;

import java.util.Date;

public class Reply {
	private int replySeq;		 // 댓글번호		
	private int postSeq;         // 게시글 번호
	private String userId;       // 사용자 아이디
	private String replyContent; // 내용
	private Date replyRegdate;   // 작성일시
	private Date replyModdate;   // 수정일시
	private int replyStatus;     // 삭제여부
	
	public int getReplySeq() {
		return replySeq;
	}
	public void setReplySeq(int replySeq) {
		this.replySeq = replySeq;
	}
	public int getPostSeq() {
		return postSeq;
	}
	public void setPostSeq(int postSeq) {
		this.postSeq = postSeq;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyRegdate() {
		return replyRegdate;
	}
	public void setReplyRegdate(Date replyRegdate) {
		this.replyRegdate = replyRegdate;
	}
	public Date getReplyModdate() {
		return replyModdate;
	}
	public void setReplyModdate(Date replyModdate) {
		this.replyModdate = replyModdate;
	}
	public int getReplyStatus() {
		return replyStatus;
	}
	public void setReplyStatus(int replyStatus) {
		this.replyStatus = replyStatus;
	}
	
	@Override
	public String toString() {
		return "Reply [replySeq=" + replySeq + ", postSeq=" + postSeq + ", userId=" + userId + ", replyContent="
				+ replyContent + ", replyRegdate=" + replyRegdate + ", replyModdate=" + replyModdate + ", replyStatus="
				+ replyStatus + "]";
	}
}
