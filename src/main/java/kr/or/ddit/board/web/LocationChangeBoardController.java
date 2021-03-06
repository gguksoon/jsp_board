package kr.or.ddit.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.board.service.BoardService;
import kr.or.ddit.board.service.IBoardService;

@WebServlet("/locationChangeBoard")
public class LocationChangeBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    private IBoardService boardService;
    
    @Override
    public void init() throws ServletException {
    	boardService = new BoardService();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardSeq = request.getParameter("boardSeq"); 
		String change = request.getParameter("change"); // up 혹은 down이 넘어옴
		
		boardService.locationChange(boardSeq, change);
		
		response.sendRedirect(request.getContextPath() + "/manageBoard");
	}

}
