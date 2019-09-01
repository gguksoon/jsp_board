package kr.or.ddit.reply.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.reply.model.Reply;

public class ReplyDao implements IReplyDao {

	@Override
	public List<Reply> getReplyList(SqlSession ss, int postSeq) {
		return ss.selectList("reply.getReplyList", postSeq);
	}

	@Override
	public int insertReply(SqlSession ss, Reply reply) {
		return ss.insert("reply.insertReply", reply);
	}

	@Override
	public int deleteReply(SqlSession ss, int replySeq) {
		return ss.update("reply.deleteReply", replySeq);
	}

}
