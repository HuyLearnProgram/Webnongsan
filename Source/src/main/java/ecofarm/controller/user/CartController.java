package ecofarm.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ecofarm.DAO.IAccountDAO;
import ecofarm.DAO.ICartDAO;
import ecofarm.entity.Account;
import ecofarm.entity.Cart;

@Controller
public class CartController {
	@Autowired
	private IAccountDAO accountDAO;
	@Autowired
	private ICartDAO cartDAO;

	@RequestMapping("cart")
	public String Index(HttpServletRequest request, HttpSession session,
			@CookieValue(value = "userEmail", defaultValue = "", required = false) String userEmail) {
		/* if (!userEmail.equals("")) { */
			Account account = accountDAO.getAccountByEmail(userEmail);
			if (account != null) {
				List<Cart> list = cartDAO.getCartByAccountID(account.getAccountId());
				session.setAttribute("carts", list);
				session.setAttribute("totalPrice", cartDAO.getTotalPrice(list));
			}
			return "user/cart";
/*		} else {
			return "redirect:/login.htm";
		}*/
	}

	@RequestMapping(value = { "/AddCart" }, method = RequestMethod.GET)
	public String AddToCart(@RequestParam(value = "productId", required = true) int productId,
			@CookieValue(value = "userEmail", defaultValue = "", required = false) String userEmail,
			HttpSession session, HttpServletRequest request) {
		/*
		 * if (userEmail.equals("")) { request.setAttribute("user", new Account());
		 * return "redirect:/login.htm"; }
		 */
		Account account = accountDAO.getAccountByEmail(userEmail);
		if (account != null) {
			cartDAO.addToCart(productId, account.getAccountId());
			List<Cart> list = cartDAO.getCartByAccountID(account.getAccountId());
			session.setAttribute("carts", list);
			session.setAttribute("totalPrice", cartDAO.getTotalPrice(list));
		}
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping(value = { "/AddCart" }, method = RequestMethod.POST)
	public String AddToCartQuantity(@RequestParam(value = "productId", required = true) int productId,
			@CookieValue(value = "userEmail", defaultValue = "", required = false) String userEmail,
			@RequestParam("quantity") String quantity, HttpSession session, HttpServletRequest request) {
		/*
		 * if (userEmail.equals("")) { request.setAttribute("user", new Account());
		 * return "redirect:/login.htm"; }
		 */

		Account account = accountDAO.getAccountByEmail(userEmail);
		if (account != null) {
			cartDAO.addToCart(productId, account.getAccountId(), Integer.parseInt(quantity));
			List<Cart> list = cartDAO.getCartByAccountID(account.getAccountId());
			session.setAttribute("carts", list);
			session.setAttribute("totalPrice", cartDAO.getTotalPrice(list));
		}
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping("/DeleteCart")
	public String DeleteFromCart(@RequestParam(value = "productId", required = true) int productId,
			@CookieValue(value = "userEmail", defaultValue = "", required = false) String userEmail,
			HttpSession session, HttpServletRequest request) {
		Account account = accountDAO.getAccountByEmail(userEmail);
		cartDAO.deleteCart(productId, account.getAccountId());
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping("/EditCart")
	public String EditCartQnt(@RequestParam(value = "productId", required = true) int productId,
			@RequestParam(value = "qty", required = true) int quantity,
			@CookieValue(value = "userEmail", defaultValue = "", required = false) String userEmail,
			HttpSession session, HttpServletRequest request) {

		Account account = accountDAO.getAccountByEmail(userEmail);
		cartDAO.editCart(productId, account.getAccountId(), quantity);
		return "redirect:" + request.getHeader("Referer");
	}
}
