package ecofarm.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ecofarm.DAO.ICategoryDAO;
import ecofarm.DAO.IFeedbackDAO;
import ecofarm.DAO.IProductDAO;
import ecofarm.entity.Product;

@Controller
@RequestMapping("/product-detail")
public class ProductDetailController {
	@Autowired
	private IProductDAO productDAO;
	@Autowired
	private ICategoryDAO categoryDAO;
	@Autowired
	private IFeedbackDAO feedbackDAO;
	
	@RequestMapping(params = {"productId"})
	public String Index(@RequestParam("productId") String productId,HttpServletRequest request) {
		Product product = productDAO.getProductByID(Integer.parseInt(productId));
		if(product!=null) {
			request.setAttribute("product",product);
			request.setAttribute("relatedProducts",productDAO.getProductsByCategoryID(product.getCategory().getCategoryId()));
			request.setAttribute("categories", categoryDAO.getAllCategories());
			request.setAttribute("feedbacks", feedbackDAO.getFeedbackByProduct(product.getProductId()));
		}
		return "user/product/productDetails";
	}
}
