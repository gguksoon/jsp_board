package kr.or.ddit.post.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.post.model.Post;

public class PostDao implements IPostDao {

	@Override
	public List<Map> getPostPagingList(SqlSession ss, Map<String, Object> map) {
		return ss.selectList("post.getPostPagingList", map);
	}

	@Override
	public int getPostTotalCnt(SqlSession ss, String boardSeq) {
		return ss.selectOne("post.getPostTotalCnt", boardSeq);
	}

	@Override
	public Post getPost(SqlSession ss, int postSeq) {
		return ss.selectOne("post.getPost", postSeq);
	}

	@Override
	public int insertPost(SqlSession ss, Post post) {
		return ss.insert("post.insertPost", post);
	}

	@Override
	public int getPostNextSeq(SqlSession ss) {
		return ss.selectOne("post.getPostNextSeq");
	}

	@Override
	public int getPostGnNextSeq(SqlSession ss) {
		return ss.selectOne("post.getPostGnNextSeq");
	}

	@Override
	public int deletePost(SqlSession ss, int postSeq) {
		return ss.update("post.deletePost", postSeq);
	}

}
