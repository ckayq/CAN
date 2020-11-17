package registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserDAOImpl;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Registration() {
    	
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");
		
		User user = new User(firstName, lastName, email, phoneNumber, password);
		
		UserDAOImpl userDAO = new UserDAOImpl();
		
		if(!firstName.equals("") && !lastName.equals("") && !email.equals("") && !phoneNumber.equals("") && !password.equals("")) {
		int result = userDAO.insertUser(user);
		response.getWriter().println(result);
		
		request.setAttribute("userCreatedMessage", "You have created an account, log in to continue.");
		request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
		} else {
			request.setAttribute("emptyMessage", "One or more fields is empty");
			request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
		}
	}

}
