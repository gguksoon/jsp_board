package kr.or.ddit.reply.service;

import java.util.List;

import kr.or.ddit.reply.model.Reply;

public interface IReplyService {

	public List<Reply> getReplyList(int postSeq);
	
	public int insertReply(Reply reply);

}
