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
		String postAuthorEmail = request.getParameter("postAuthorEmail");
		String userWhoLiked = request.getParameter("userWhoLiked");
		int like = 1;
		
		Like likeObj = new Like();
		
		LikeDAO likeDAO = new LikeDAOImpl();
		
		likeDAO.insertLike(Integer.parseInt(postID), postAuthorEmail, userWhoLiked, like);
		
		response.sendRedirect("Main_Page.jsp");
	}
}
