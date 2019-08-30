package kr.or.ddit.post.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class PostDao implements IPostDao {

	@Override
	public List<Map> getPostPagingList(SqlSession ss, Map<String, Object> map) {
		return ss.selectList("post.getPostPagingList", map);
	}

	@Override
	public int getPostTotalCnt(SqlSession ss, String boardSeq) {
		return ss.selectOne("post.getPostTotalCnt", boardSeq);
	}

}
