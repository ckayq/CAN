package createPost;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import post.Post;
import post.PostDAO;
import post.PostDAOImpl;
import user.User;

@MultipartConfig

@WebServlet("/CreatePost")
public class CreatePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CreatePost() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postTitle = request.getParameter("postTitle");
		String postBody = request.getParameter("postBody");
		Timestamp date = new Timestamp(new Date().getTime());

		// Getting current user Email_ID
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("currentUser");
		
		Post post = new Post(user.getEmail(), date, postTitle, postBody);
		
		PostDAO postDAO = new PostDAOImpl();
		
		if(!postTitle.equals("") && !postBody.equals("") && post!=null) {
			if(postDAO.insertPost(post)) {
				System.out.println("Post created");
				
				response.sendRedirect("http://localhost:8080/CAN/Profile_Page.jsp");
			}
		} else {
			request.setAttribute("emptyEntryMessage", "Please fill in the post title and body!");
			request.getRequestDispatcher("CreatePostPage.jsp").forward(request, response);
		}
	}
}