package kr.or.ddit.post.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import kr.or.ddit.user.model.User;
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
		request.getRequestDispatcher("/insertPost.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		private int postSeq;		// 게시글 번호
//		private int boardSeq;    	// 게시판 번호
//		private String postNm;      // 게시글 제목
//		private String postContent; // 게시글 내용
//		private String userId;      // 작성자
//		private Date postRegDate; 	// 작성일시
//		private Date postModDate; 	// 수정일시
//		private int postStatus;  	// 삭제여부
//		private int postGn;			// 게시글 그룹번호
//		private int parentSeq;   	// 부모게시글번호
		request.setCharacterEncoding("UTF-8");
		
		request.setAttribute("boardList", boardService.getBoardList());
		
		
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		String userId = request.getParameter("userId");
		String postNm = request.getParameter("postNm");
		String postContent = request.getParameter("content");
		String paramGn = request.getParameter("postGn");
		int postGn = paramGn == null ? 0 : Integer.parseInt(paramGn);
		String paramParentSeq = request.getParameter("parentSeq");
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
		if(files.getSize() > 0) {
			filename = FileuploadUtil.getFilename(files.getHeader("Content-Disposition"));
			String realFilename = UUID.randomUUID().toString();
			String ext = FileuploadUtil.getFileExtension(files.getHeader("Content-Disposition"));
			path = FileuploadUtil.getPath() + realFilename + ext;
			
			files.write(path); 
		}
		
		if(true) { // 저장 성공 ==> 사용자 상세화면으로 이동
			response.sendRedirect(request.getContextPath() + "/post?postSeq=" + resultPost.getPostSeq());
		}
		
		//====================================================================
	}

}
