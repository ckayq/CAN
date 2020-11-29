package resetPassword;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserDAO;
import user.UserDAOImpl;

@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ResetPassword() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO userDAO = new UserDAOImpl();
		
		String email = request.getParameter("email");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phoneNumber = request.getParameter("phoneNumber");
		String newPassword = request.getParameter("newPassword");

		User user = new User();
		
		user = userDAO.resetUserPassword(email, firstName, lastName, phoneNumber, newPassword);
		
		if(user.getEmail() != null && user.getFirstName() != null && user.getLastName() != null && user.getPhoneNumber() != null){
			if(email != null && firstName != null && lastName != null && phoneNumber != null && newPassword != null) {
				if(user.getEmail().equals(email) && user.getFirstName().equals(firstName) && user.getLastName().equals(lastName) && user.getPhoneNumber().equals(phoneNumber)) {
					request.setAttribute("passwordChangegMessage", "You have successfully changed your password");
					request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
				} else {
					request.setAttribute("wrongDataMessage", "Some of the data do not match");
					request.getRequestDispatcher("ResetPasswordPage.jsp").forward(request, response);
				}
			} 
		} else {
			request.setAttribute("wrongDataMessage", "Some of the data do not match");
			request.getRequestDispatcher("ResetPasswordPage.jsp").forward(request, response);
		}
	}
}
