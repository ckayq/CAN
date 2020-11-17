package likePost;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbConnection.ConnectionProvider;
import like.LikeDAO;
import like.LikeDAOImpl;

@WebServlet("/LikePost")
public class LikePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LikePostServlet() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
        	String operation = request.getParameter("operaion");
        	int postID = Integer.parseInt(request.getParameter("postID"));
        	String email_ID = request.getParameter("email_ID");
        	
        	LikeDAO likeDAO = new LikeDAOImpl(ConnectionProvider.getConnection());
        	
        	if(operation.equals("like")) {
        		boolean flag = likeDAO.insertLike(postID, email_ID);
        		
        		out.println(flag);
        	}
        }
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
