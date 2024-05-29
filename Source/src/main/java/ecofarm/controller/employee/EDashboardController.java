package ecofarm.controller.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ecofarm.DAO.IAccountDAO;
import ecofarm.DAO.IAccountDAO.EnumRole;
import ecofarm.DAO.IOrderDAO;
import ecofarm.entity.Account;
import ecofarm.entity.Orders;

@Controller
@RequestMapping(value = "employee/dashboard")
public class EDashboardController {
	@Autowired
	private IAccountDAO accountDAO;
	@Autowired
	private IOrderDAO orderDAO;
	@RequestMapping()
	public String index(ModelMap model) {

		double totalOrder = 0;
		List<Orders> orders = orderDAO.getOrders();
		for (Orders o : orders) {
			if (o.getStatus() == 2)
				totalOrder += o.getPrice();
		}

		List<Account> client = accountDAO.listAccountWithRole(EnumRole.GUEST, null);
		model.addAttribute("totalOrder", orders.size());
		model.addAttribute("totalEarning", totalOrder);
		model.addAttribute("totalClient", client.size());

		return "employee/emp-dashboard";

	}
}
