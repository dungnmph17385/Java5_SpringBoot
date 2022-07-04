package Assignment.controllers;

import java.awt.print.Pageable;
import java.io.File;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Assignment.beans.ProductModel;
import Assignment.entities.Account;
import Assignment.entities.Category;
import Assignment.entities.Product;
import Assignment.repositories.AccountRepository;
import Assignment.repositories.CategoryRepositoy;
import Assignment.repositories.Order_detailRepository;
import Assignment.repositories.ProductRepository;
import Assignment.ultis.EncryptUtil;
import Assignment.ultis.UploadFileUtils;

@Controller

public class HomeController {
	@Autowired
	private AccountRepository accountRepo;
	@Autowired
	private ProductRepository productRepo;
	@Autowired
	private Order_detailRepository orderDetaiRepo;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private CategoryRepositoy categoryRepo;
	@Autowired
	private UploadFileUtils uploadUtil;
	@RequestMapping("/users/home")
	public String home(Model model,@RequestParam("p") Optional<Integer> p) {
		HttpSession session=request.getSession();
		Account account=(Account)session.getAttribute("account");
		if(account!=null) {
			model.addAttribute("account", account);
		}
		org.springframework.data.domain.Pageable pageable = PageRequest.of(p.orElse(0), 8);
		Page<Product> listProduct = this.productRepo.findAll(pageable);
		
		List<Category>listCategoey=this.categoryRepo.findAll();
		model.addAttribute("listCategory", listCategoey);
//		List<Product>listProduct=this.productRepo.findAll();
		model.addAttribute("listProduct", listProduct);
		model.addAttribute("views", "/views/users/home.jsp");
		return "layout";
	}
	

	
	@RequestMapping("findProductByCategoryId/{id}")
	public String findProductByCategoryId(@PathVariable("id")Integer id,Model model) {
//		index(model);
		System.out.println("categoryId:"+id);
		
		List<Product>listProduct=this.productRepo.findByIdPro(id);
		
		List<Category>listCategoey=this.categoryRepo.findAll();
		model.addAttribute("listCategory", listCategoey);
		model.addAttribute("listProduct", listProduct);
		model.addAttribute("views", "/views/home.jsp");
		return "layout";
	}
	
	@GetMapping("/auth/register")
	public String register(Model model, @ModelAttribute("account") Account acc) {
		model.addAttribute("views", "/views/auth/register.jsp");
		return "layout";
	}
	
	@PostMapping("/auth/register")
	public String registerStore(Model model, @ModelAttribute("account") Account account,
			@RequestParam("upload_file") MultipartFile uploadFile) {
		account.setPhoto(uploadFile.getOriginalFilename());
		String hashedPassword=EncryptUtil.hash(account.getPassword());
		account.setPassword(hashedPassword);
		File a = this.uploadUtil.handleUpLoadFile(uploadFile);

		this.accountRepo.save(account);
		return "redirect:/auth/login";
	}
}
