package kr.or.ddit.post.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface IPostDao {

	public List<Map> getPostPagingList(SqlSession ss, Map<String, Object> map);

	public int getPostTotalCnt(SqlSession ss, String boardSeq);
}
