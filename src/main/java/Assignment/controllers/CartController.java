package Assignment.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Assignment.beans.OrderModel;
import Assignment.entities.Account;
import Assignment.entities.Cart;
import Assignment.entities.Order;
import Assignment.entities.Product;
import Assignment.repositories.CartRepository;
import Assignment.repositories.OrderRepository;
import Assignment.repositories.Order_detailRepository;
import Assignment.repositories.ProductRepository;

@Controller
public class CartController {
	@Autowired
	private CartRepository cartRepo;

	@Autowired
	private OrderRepository orderRepo;

	@Autowired
	private ProductRepository proRepo;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private Order_detailRepository orderDetailRepo;

	@GetMapping("/users/cart")
	public String cart(Model model) {
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("account");
		if (acc != null) {
			List<Cart> Listcart = this.cartRepo.findAllCartByAccountId(acc.getId());
			model.addAttribute("listCart", Listcart);
		}

		model.addAttribute("views", "/views/users/cart.jsp");
		return "layout";
	}

	@PostMapping("/users/store/cart/{id}/{price}")
	private String createCart(@PathVariable("id") Integer id, @PathVariable("price") Double price,
			@RequestParam("quantity") Integer quantity, Cart cart) {
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("account");
		if (acc != null) {
			List<Cart> listCart = this.cartRepo.findAll();
			Product pro = this.proRepo.getOne(id);
			boolean kt = true;
			for (Cart card : listCart) {
				if (card.getProduct().getId() == id) {

					System.out.println("----------- sản phẩm trùng trong giỏ hàng ---------");
					cart.setId(card.getId());
					cart.setPrice(price * (quantity + card.getQuantity()));
					cart.setQuantity(quantity + card.getQuantity());
					cart.setAccount(acc);
					cart.setProduct(pro);
					this.cartRepo.save(cart);
					kt = false;
					break;
				}
			}

			if (kt != false) {
				cart.setPrice(price);
				cart.setQuantity(quantity);
				cart.setAccount(acc);
				cart.setProduct(pro);
				this.cartRepo.save(cart);
			}

		} else {
			System.out.println("chưa đăng nhập lấy đâu account");
		}

		return "redirect:/users/cart";
	}
}
