package kr.or.ddit.post.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.post.model.Post;
import kr.or.ddit.post.repository.IPostDao;
import kr.or.ddit.post.repository.PostDao;
import kr.or.ddit.util.MybatisUtil;

public class PostService implements IPostService {

	private IPostDao postDao;
	
	public PostService() {
		postDao = new PostDao();
	}
	
	@Override
	public Map<String, Object> getPostPagingList(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		SqlSession ss = MybatisUtil.getSession();
		String boardSeq = "" + map.get("boardSeq");
		List<Map> postList = postDao.getPostPagingList(ss, map);
		int totalCnt = postDao.getPostTotalCnt(ss, boardSeq);
		
		int pagesize = (int) map.get("pagesize");
		
		resultMap.put("postList", postList);
		resultMap.put("paginationSize", (int)Math.ceil((double)totalCnt / pagesize));
		
		ss.close();
		
		return resultMap;
	}

}
