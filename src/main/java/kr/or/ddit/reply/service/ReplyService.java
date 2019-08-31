package kr.or.ddit.reply.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.reply.model.Reply;
import kr.or.ddit.reply.repository.IReplyDao;
import kr.or.ddit.reply.repository.ReplyDao;
import kr.or.ddit.util.MybatisUtil;

public class ReplyService implements IReplyService {

	private IReplyDao replyDao;
	
	public ReplyService() {
		replyDao = new ReplyDao();
	}

	
	@Override
	public List<Reply> getReplyList(int postSeq) {
		SqlSession ss = MybatisUtil.getSession();
		List<Reply> replyList = replyDao.getReplyList(ss, postSeq);
		ss.close();
		
		return replyList;
	}

	@Override
	public int insertReply(Reply reply) {
		SqlSession ss = MybatisUtil.getSession();
		int insertCnt = replyDao.insertReply(ss, reply);
		
		ss.commit();
		ss.close();
		
		return insertCnt;
	}

}
