package kr.or.ddit.reply.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.reply.model.Reply;

public interface IReplyDao {

	public List<Reply> getReplyList(SqlSession ss, int postSeq);

	public int insertReply(SqlSession ss, Reply reply);

}
