package Assignment.controllers;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Assignment.beans.CategoryModel;
import Assignment.beans.OrderModel;
import Assignment.entities.Account;
import Assignment.entities.Cart;
import Assignment.entities.Category;
import Assignment.entities.Order;
import Assignment.entities.OrderDetail;
import Assignment.entities.Product;
import Assignment.entities.ProductModel;
import Assignment.repositories.AccountRepository;
import Assignment.repositories.CartRepository;
import Assignment.repositories.CategoryRepositoy;
import Assignment.repositories.OrderRepository;
import Assignment.repositories.ProductRepository;
import Assignment.ultis.UploadFileUtils;

@Controller
//@RequestMapping("/admin/orders")
public class OrderController {
	@Autowired
	private OrderRepository orderRepo;
	@Autowired
	private AccountRepository accRepo;
	@Autowired
	private ProductRepository productRepo;
	@Autowired
	private CartRepository cartRepo;
	
	@Autowired
	private HttpServletRequest request;

	@Autowired
	private UploadFileUtils uploadUtil;
	
	@RequestMapping("/users/productDetail/{id}")
	public String productDetail(Model model, @PathVariable("id") Integer id) {
		System.out.println("--------------------------" + id);
		Product product = this.productRepo.getOne(id);
		model.addAttribute("product", product);
		model.addAttribute("views", "/views/users/productDetail.jsp");
		return "layout";
	}
	@GetMapping("/users/order")
	public String order(Model model, Order order, OrderDetail orderDetail,
			@ModelAttribute("product") ProductModel pro) {

		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("account");
//		order = (Order) session.getAttribute("order");

		List<Cart> listCard = this.cartRepo.findAllCartByAccountId(account.getId());

		List<Product> listPro = this.productRepo.findAll();
		model.addAttribute("listPro", listPro);
		double tong = 0;
		for (Cart list : listCard) {
			tong += list.getPrice();

			model.addAttribute("total", tong);
			System.out.println(list.getProduct().getName());
		}

		model.addAttribute("listCard", listCard);
		model.addAttribute("account", account);
//		model.addAttribute("order", order);

		model.addAttribute("views", "/views/users/order.jsp");
		return "layout";
	}
	@GetMapping("/admin/orders/create")
	public String create(Model model, @ModelAttribute("order") Order order)
	{
		List<Account> acc = this.accRepo.findAll();
		model.addAttribute("acc", acc);
		model.addAttribute("views", "/views/admin/orders/create.jsp");
		return "layout";
	}
	@GetMapping("/admin/orders/edit/{id}")
	public String edit(Model model,@PathVariable("id") Integer id,@ModelAttribute("order") Order order) {
		List<Account> a = this.accRepo.findAll();
		model.addAttribute("acc", a);
		order = this.orderRepo.getOne(id);
		model.addAttribute("order",order);
		model.addAttribute("views", "/views/admin/orders/edit.jsp");
		return "layout";
	}
	@PostMapping("/admin/orders/update/{id}")
	public String update(Model model,@Valid@PathVariable("id") Integer id, Order order,BindingResult result) {
		Order or = this.orderRepo.getOne(id);
		order.setId(id);
		order.setAddress(or.getAddress());
		order.setCreatedDate(new Date());
		order.setUser(or.getUser());
		this.orderRepo.save(order);
		return "redirect:/admin/orders/index";
		
	}
	@PostMapping("/admin/orders/store")
	public String store(Model model,@RequestParam("user_id") Integer id,Order order)
	{
			Account acc = accRepo.getOne(id);
			System.out.println(id);
			order.setUser(acc);
			order.setCreatedDate(new Date());
			this.orderRepo.save(order);
			return "redirect:/admin/orders/index";
		
	}
	
	@GetMapping("/admin/orders/delete/{id}")
	public String delete(@PathVariable("id") Order order) 
	{
		this.orderRepo.delete(order);
		return "redirect:/admin/orders/index";
	}
	
	@GetMapping("/admin/orders/index")
	public String index(
		Model model,
		@RequestParam(name="page", defaultValue="0") Integer page,
		@RequestParam(name="size", defaultValue="10") Integer size
	) {
		Pageable pageable = PageRequest.of(page, size);
		Page<Order> data = this.orderRepo.findAll(pageable);
		model.addAttribute("data", data);
		model.addAttribute("views", "/views/admin/orders/index.jsp");
		return "layout";
	}
}
