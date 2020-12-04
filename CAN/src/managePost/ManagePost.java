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

@WebServlet("/ManagePost")
public class ManagePost extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ManagePost() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postID = request.getParameter("postID");
		String postTitle = request.getParameter("postTitle");
		String postBody = request.getParameter("postBody");
		
		Post post = new Post();
		
		PostDAO postDAO = new PostDAOImpl();
		
		if(postTitle.equals("") || postBody.equals("")) {
			request.setAttribute("emptyInputMessage", "Please fill the post Title and post Body fields!");
			request.getRequestDispatcher("EditPost.jsp").forward(request, response);
		} else {
			post = postDAO.editPost(Integer.parseInt(postID), postTitle, postBody);
			
			request.setAttribute("postUpdatedMessage", "You have successfully updated your post!");
			request.getRequestDispatcher("Profile_Page.jsp").forward(request, response);
		}
		
	}

}
