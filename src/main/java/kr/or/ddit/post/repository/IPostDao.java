package kr.or.ddit.post.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.post.model.Post;

public interface IPostDao {

	public List<Map> getPostPagingList(SqlSession ss, Map<String, Object> map);

	public int getPostTotalCnt(SqlSession ss, String boardSeq);

	public Post getPost(SqlSession ss, int postSeq);

	public int insertPost(SqlSession ss, Post post);

	public int getPostNextSeq(SqlSession ss);

	public int getPostGnNextSeq(SqlSession ss);
}
