package logIn;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserDAO;
import user.UserDAOImpl;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO userDAO = new UserDAOImpl();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String submitBtn = request.getParameter("submit");

		User user = new User();
		
		user = userDAO.getUser(email, password, user.getFirstName());
		
		if(submitBtn.equals("Login") && user!=null && user.getEmail()!=null && user.getPassword()!=null) {
			request.setAttribute("message", user.getFirstName());
			request.getRequestDispatcher("Main_Page.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "No such user! Please create an account first.");
			request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
		}
	}
}
