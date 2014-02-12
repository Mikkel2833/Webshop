package dk.mmj;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddToBasket")
public class AddToBasket_servlet extends HttpServlet 
{      
   private static final long serialVersionUID = 1L;

   protected void doPost(HttpServletRequest request, 
   		 HttpServletResponse response) 					    throws ServletException, IOException 
   {
      HttpSession session = request.getSession(true);
      ShoppingBasket basket = (ShoppingBasket)session.getAttribute("SHOPPING_BASKET");
      if(basket == null)
      {
         basket = new ShoppingBasket();
         session.setAttribute("SHOPPING_BASKET", basket);
      }
   		
      String name = request.getParameter("productName");
      double price = Double.parseDouble(request.getParameter("price"));
      int id = Integer.parseInt(request.getParameter("idVare"));
      int count = Integer.parseInt(request.getParameter("count"));
      Item item = new Item(name, price, id, count);
      basket.addToBasket(item);		
   		
      response.sendRedirect("/Webshop/jsps/Products.jsp");
   }
}
