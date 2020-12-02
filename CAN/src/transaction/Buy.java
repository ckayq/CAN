package transaction;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserDAO;
import user.UserDAOImpl;

@WebServlet("/Buy")
public class Buy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Buy() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String statusID = request.getParameter("statusID"); 
		String statusPrice = request.getParameter("statusPrice"); 
		String userCoins = request.getParameter("userCoins"); 
		String email = request.getParameter("email");
		
		User user = new User();
		
		UserDAO userDAO = new UserDAOImpl();
		
		System.out.println(userCoins);
		
		if(Double.parseDouble(userCoins) >= Integer.parseInt(statusPrice.trim())) {
			user = userDAO.userBuysStatus(email, Integer.parseInt(statusID), Integer.parseInt(statusPrice), Double.parseDouble(userCoins));
			
			request.setAttribute("statusBoughtMessage", "You have purchased the status!");
			request.getRequestDispatcher("store_page.jsp").forward(request, response);
			
			System.out.print("If here");
		} else {
			request.setAttribute("notEnoughCoinsMessage", "You do not have enough coins to buy this product!");
			request.getRequestDispatcher("store_page.jsp").forward(request, response);
			
			System.out.print("Else here");
		}
	}

}
