package likePost;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import like.Like;
import like.LikeDAO;
import like.LikeDAOImpl;
import user.User;

@WebServlet("/LikePost")
public class LikePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LikePostServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postID = request.getParameter("postID");
		String postAuthor = request.getParameter("postAuthor");
		double likes = 1;
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("currentUser");
		
		Like like = new Like(Integer.parseInt(postID), postAuthor, likes);
		
		LikeDAO likeDAO = new LikeDAOImpl();
		
		likeDAO.insertLike(likes, postAuthor);
		
		response.sendRedirect("http://localhost:8080/CAN/Main_Page.jsp");
	}
}
