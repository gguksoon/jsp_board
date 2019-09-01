package kr.or.ddit.post.web;

import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.post.model.Post;
import kr.or.ddit.post.service.IPostService;
import kr.or.ddit.post.service.PostService;
import kr.or.ddit.util.FileuploadUtil;

@WebServlet("/insertPost")
public class InsertPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final Logger logger = LoggerFactory.getLogger(InsertPostController.class);
	
	private IBoardService boardService;
	private IPostService postService;
	
	@Override
	public void init() throws ServletException {
		boardService = new BoardService();
		postService = new PostService();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("boardList", boardService.getBoardList());
		request.setAttribute("board", boardService.getBoard(request.getParameter("boardSeq")));
		
		// 답글인 경우
		String paramPostSeq = request.getParameter("postSeq");
		String paramPostGn = request.getParameter("postGn");
		
		int postSeq = paramPostSeq == null ? 0 : Integer.parseInt(paramPostSeq); 
		int postGn = paramPostGn == null ? 0 : Integer.parseInt(paramPostGn);
		
		if(postSeq != 0 && postGn != 0) {
			request.setAttribute("postSeq", postSeq);
			request.setAttribute("postGn", postGn);
		}
		
		request.getRequestDispatcher("/insertPost.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		request.setAttribute("boardList", boardService.getBoardList());
		
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		String userId = request.getParameter("userId");
		String postNm = request.getParameter("postNm");
		String postContent = request.getParameter("content");
		String paramGn = request.getParameter("postGn");
		int postGn = paramGn == null ? 0 : Integer.parseInt(paramGn) + 1;
		String paramParentSeq = request.getParameter("postSeq");
		Integer parentSeq = paramParentSeq == null ? null : Integer.parseInt(paramParentSeq);
		
		Post post = new Post(0, boardSeq, postNm, postContent, userId,
							 new Date(), new Date(), 1, postGn, parentSeq);
		
		int postSeq = postService.insertPost(post);
		Post resultPost = postService.getPost(postSeq);
		request.setAttribute("post", resultPost);
		
		//====================================================================
		Part files = request.getPart("upFile");
		
		// 사용자가 파일을 업로드한 경우
		String filename = "";
		String path = "";
//		if(files.getSize() > 0) {
//			filename = FileuploadUtil.getFilename(files.getHeader("Content-Disposition"));
//			String realFilename = UUID.randomUUID().toString();
//			String ext = FileuploadUtil.getFileExtension(files.getHeader("Content-Disposition"));
//			path = FileuploadUtil.getPath() + realFilename + ext;
//			
//			files.write(path); 
//		}
		
		if(true) { // 저장 성공 ==> 사용자 상세화면으로 이동
			response.sendRedirect(request.getContextPath() + "/post?postSeq=" + resultPost.getPostSeq());
		}
		
		//====================================================================
	}

}
