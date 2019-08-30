package kr.or.ddit.login.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.board.model.Board;
import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.user.model.User;
import kr.or.ddit.user.service.IUserService;
import kr.or.ddit.user.service.UserService;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	private IUserService userService;
	private IBoardService boardService;
	
	@Override
	public void init() throws ServletException {
		userService = new UserService();
		boardService = new BoardService();
	}
	
	// 화면 요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 웹 브라우저가 보낸 cookie 확인
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				logger.debug("cookie name : {}, cookie value : {}, cookie path: {}",
						cookie.getName(), cookie.getValue(), cookie.getPath());
			}
		}
		
		// 응답을 생성할 때 웹브라우저에게 쿠키를 저장할 것을 지시
		Cookie cookie = new Cookie("serverGen", "serverValue");
		cookie.setMaxAge(60 * 60 * 24 * 7);
		response.addCookie(cookie);
		
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	// 로그인 요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String pass = request.getParameter("pass");
		String rememberMe = request.getParameter("remember");
		
		manageUserIdCookie(response, userId, rememberMe);
		
		User user = userService.getUser(userId);
		
		if(user == null) { // 유저가 존재하지 않을 경우
			doGet(request, response);
		} else if(user.checkLoginValidate(userId, pass)) { // 유저가 존재할 경우
			HttpSession session = request.getSession();
			List<Board> boardList = boardService.getBoardList();
			
			session.setAttribute("S_USERVO", user);
			request.setAttribute("elTest", "elTestValue");
			request.setAttribute("boardList", boardList);
			
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		} else {
			request.setAttribute("userId", userId);
			doGet(request, response);
		}
		
		
	}

	private void manageUserIdCookie(HttpServletResponse response, String userId, String rememberMe) {
		// rememberMe 파라미터가 존재할 경우 userId를 cookie로 생성
		Cookie cookie = new Cookie("userId", userId);
		if(rememberMe != null)
			cookie.setMaxAge(60 * 60 * 24 * 30); // second
		else 
			cookie.setMaxAge(0);
		response.addCookie(cookie);	
	}

}
