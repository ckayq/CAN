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
		String avatarID = request.getParameter("avatarID");
		String statusPrice = request.getParameter("statusPrice"); 
		String avatarPrice = request.getParameter("avatarPrice"); 
		String statusURL = request.getParameter("statusURL"); 
		String avatarURL = request.getParameter("avatarURL");
		String userCoins = request.getParameter("userCoins"); 
		String email = request.getParameter("email");
		
		User user = new User();
		
		UserDAO userDAO = new UserDAOImpl();
		
		if(request.getParameter("buyAvatar") != null) {
			System.out.println("Buy Avatar");
			
			if(Double.parseDouble(userCoins) >= Integer.parseInt(avatarPrice.trim())) {
				user = userDAO.userBuysAvatar(email.trim(), Integer.parseInt(avatarID.trim()), Integer.parseInt(avatarPrice.trim()), avatarURL.trim(), Double.parseDouble(userCoins.trim()));
				
				request.setAttribute("avatarBoughtMessage", "You have purchased the avatar!");
				request.getRequestDispatcher("store_page.jsp").forward(request, response);
			} else {
				request.setAttribute("notEnoughCoinsMessage", "You do not have enough coins to buy this avatar!");
				request.getRequestDispatcher("store_page.jsp").forward(request, response);
			}
		} else if (request.getParameter("buyStatus") != null) {
			System.out.println("Buy Status");
			
			if(Double.parseDouble(userCoins) >= Integer.parseInt(statusPrice.trim())) {
				user = userDAO.userBuysStatus(email.trim(), Integer.parseInt(statusID.trim()), Integer.parseInt(statusPrice.trim()), statusURL.trim(), Double.parseDouble(userCoins.trim()));
				
				request.setAttribute("statusBoughtMessage", "You have purchased the status!");
				request.getRequestDispatcher("store_page.jsp").forward(request, response);
			} else {
				request.setAttribute("notEnoughCoinsMessage", "You do not have enough coins to buy this status!");
				request.getRequestDispatcher("store_page.jsp").forward(request, response);
			}
		}
	}

}
