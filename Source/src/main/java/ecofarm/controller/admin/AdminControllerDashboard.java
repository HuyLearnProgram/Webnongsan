package ecofarm.controller.admin;

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
@RequestMapping(value = "/admin/dashboard")
public class AdminControllerDashboard {
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

		// Role role = accountDAO.getRoleViaEnum(EnumRoleID.GUEST);
		List<Account> client = accountDAO.listAccountWithRole(EnumRole.GUEST, null);
		// client = client.stream().filter(rate ->
		// rate.getRole().equals(role)).collect(Collectors.toList());

		model.addAttribute("totalOrder", orders.size());
		model.addAttribute("totalEarning", totalOrder);
		model.addAttribute("totalClient", client.size());

		return "admin/dashboard";

	}
}
