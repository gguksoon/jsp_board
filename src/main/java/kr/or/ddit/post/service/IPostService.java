package kr.or.ddit.post.service;

import java.util.Map;

import kr.or.ddit.post.model.Post;

public interface IPostService {

	public Map<String, Object> getPostPagingList(Map<String, Object> map);

	public Post getPost(int postSeq);

	public int insertPost(Post post);

	public int deletePost(int postSeq);
}
