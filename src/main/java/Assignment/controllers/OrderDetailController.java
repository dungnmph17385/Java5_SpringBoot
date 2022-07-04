package Assignment.controllers;

import java.util.List;
import java.util.Optional;

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

import Assignment.beans.OrderDetailModel;
import Assignment.entities.Order;
import Assignment.entities.OrderDetail;
import Assignment.entities.Product;
import Assignment.repositories.OrderRepository;
import Assignment.repositories.Order_detailRepository;
import Assignment.repositories.ProductRepository;

@Controller
@RequestMapping("/admin/orderDetail")
public class OrderDetailController {
	@Autowired
	private Order_detailRepository orderDetailRepo;
	@Autowired
	private OrderRepository orderRepo;
	@Autowired
	private ProductRepository productRepo;
	
	@GetMapping("/create")
	public String create(Model model,@ModelAttribute("orderDetail") OrderDetailModel orderDetail)
	{
		List<Order> o = this.orderRepo.findAll();
		model.addAttribute("o", o);
		List<Product> pro = this.productRepo.findAll();
		model.addAttribute("pro", pro);
		return "/admin/orderDetail/create";
	}
	@GetMapping("edit/{id}")
	public String edit(Model model,@PathVariable("id") Integer id,OrderDetail orderDetail) {
		List<Order> o = this.orderRepo.findAll();
		model.addAttribute("o", o);
		List<Product> p = this.productRepo.findAll();
		model.addAttribute("p", p);
		orderDetail = this.orderDetailRepo.findById(id).get();
		model.addAttribute("orderDetail", orderDetail);
		return "/admin/orderDetail/edit";
	}
	@PostMapping("/update/{id}")
	public String update(Model model,@Valid @PathVariable("id") Integer id,OrderDetail orderDetail,BindingResult result) {
		if (result.hasErrors() == true) {
			System.out.println("Có lỗi");
			model.addAttribute("error", result.getAllErrors());
			return "admin/orderDetail/edit";
		}else {
			orderDetail.setOrder(orderDetail.getOrder());
			orderDetail.setProduct(orderDetail.getProduct());
			orderDetail.setPrice(orderDetail.getPrice());
			orderDetail.setQuantity(orderDetail.getQuantity());
			this.orderDetailRepo.save(orderDetail);
			return "redirect:/admin/orderDetail/index";
			
		}
		
	}
	@PostMapping("/store")
	public String store(Model model,@Valid OrderDetailModel orDetailmd,BindingResult result)
	{	if (result.hasErrors() == true) {
		System.out.println("Có lỗi");
		model.addAttribute("error", result.getAllErrors());
		return "admin/orderDetail/edit";
	}else {
		Product p = new Product();
		p.setId(orDetailmd.getProduct_id());
		Order o = new Order();
		o.setId(orDetailmd.getOrder_id());
		
		OrderDetail or = new OrderDetail();
		or.setId(orDetailmd.getId());
		or.setProduct(p);
		or.setOrder(o);
		or.setPrice(orDetailmd.getPrice());
		or.setQuantity(orDetailmd.getQuantity());
		this.orderDetailRepo.save(or);
		return "redirect:/admin/orderDetail/index";
	}
		
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") OrderDetail orderDetail) 
	{
		System.out.println(orderDetail.getId());
		// Account a = this.accountRepo.getById(id);
		this.orderDetailRepo.delete(orderDetail);
		return "redirect:/admin/orderDetail/index";
	}
	
	@GetMapping("index")
	public String index(
		Model model,
		@RequestParam(name="page", defaultValue="0") Integer page,
		@RequestParam(name="size", defaultValue="10") Integer size
	) {
		Pageable pageable = PageRequest.of(page, size);
		Page<OrderDetail> data = this.orderDetailRepo.findAll(pageable);
		model.addAttribute("data", data);
		return "/admin/orderDetail/index";
	}
}
