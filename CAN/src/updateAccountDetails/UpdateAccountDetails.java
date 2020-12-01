package updateAccountDetails;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserDAO;
import user.UserDAOImpl;

@WebServlet("/UpdateAccountDetails")
public class UpdateAccountDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateAccountDetails() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		
		UserDAO userDAO = new UserDAOImpl();
		
		String email = request.getParameter("email");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phoneNumber = request.getParameter("phoneNumber");
		String bio = request.getParameter("bio");
		String newPassword = request.getParameter("newPassword");
		
		if(firstName.equals("") && lastName.equals("") && bio.equals("") && phoneNumber.equals("") && newPassword.equals("")) {
			request.setAttribute("emptyInputMessage", "Please enter your new account details or go back to the profile page!");
			request.getRequestDispatcher("EditAccountDetails.jsp").forward(request, response);
		} else if(firstName.equals("") || lastName.equals("") || phoneNumber.equals("") || newPassword.equals("")) {	
			
			request.setAttribute("emptyInputMessage", "Please enter your new account details or go back to the profile page!");
			request.getRequestDispatcher("EditAccountDetails.jsp").forward(request, response);
		} else if(bio.equals("")) {
			user = userDAO.updateAccountDetails(email, firstName, lastName, phoneNumber, bio, newPassword);	
			
			request.setAttribute("settingsUpdatedMessage", "Your account settings were updated!");
			request.getRequestDispatcher("Profile_Page.jsp").forward(request, response);
		} else {
			user = userDAO.updateAccountDetails(email, firstName, lastName, phoneNumber, bio, newPassword);	
			
			request.setAttribute("settingsUpdatedMessage", "Your account settings were updated!");
			request.getRequestDispatcher("Profile_Page.jsp").forward(request, response);
		}		
		
		System.out.println(user.getFirstName());
		System.out.println(user.getLastName());
		System.out.println(user.getBio());
		System.out.println(user.getPhoneNumber());
		System.out.println(user.getPassword());
	}
}
