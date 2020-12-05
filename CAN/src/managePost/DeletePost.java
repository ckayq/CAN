package managePost;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post.Post;
import post.PostDAO;
import post.PostDAOImpl;

@WebServlet("/DeletePost")
public class DeletePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeletePost() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postID = request.getParameter("postID");
		String fmtPostID = postID.trim();
		boolean post;
		
		PostDAO postDAO = new PostDAOImpl();
		
		post = postDAO.deletePost(Integer.parseInt(fmtPostID));
		if(post != false) {
			request.setAttribute("postDeletedMessage", "You have successfully deleted your post!");
			request.getRequestDispatcher("Profile_Page.jsp").forward(request, response);
		} else {
			request.setAttribute("postNotDeletedMessage", "Could not delete post");
			request.getRequestDispatcher("Profile_Page.jsp").forward(request, response);
		}
	}

}
