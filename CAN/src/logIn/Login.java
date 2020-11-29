package logIn;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		user = userDAO.getUser(email, password, user.getFirstName(), user.getLastName(), user.getCoins(), user.getBio());
		
		if(submitBtn.equals("Login") && user!=null && user.getEmail()!=null && user.getPassword()!=null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("currentUser", user);
			
			response.sendRedirect("Main_Page.jsp");
		} else {
			request.setAttribute("wrongUserMessage", "The email or password you entered is incorrect");
			request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
		}
	}
}
