package Assignment.controllers;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Assignment.entities.Category;
import Assignment.entities.Product;
import Assignment.repositories.CategoryRepositoy;
import Assignment.repositories.ProductRepository;
import Assignment.ultis.UploadFileUtils;

@Controller
@RequestMapping("/admin/products")
public class ProductController {
	@Autowired
	private ProductRepository productRepo;
	@Autowired
	private CategoryRepositoy categoryRepo;
	@Autowired
	private UploadFileUtils upload;
	@Autowired
	HttpServletRequest request;

	@GetMapping("create")
	public String create(Model model,@ModelAttribute("product") Product product) {
		List<Category> category = this.categoryRepo.findAll();
		model.addAttribute("categoryData", category);
		model.addAttribute("views", "/views/admin/products/create.jsp");
		return "layout";
	}

	@GetMapping("edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id,@ModelAttribute("product") Product product) {
		product=this.productRepo.getOne(id);
		List<Category>listCategory=this.categoryRepo.findAll();
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("product", product);
		model.addAttribute("views", "/views/admin/products/edit.jsp");
		return "layout";
	}

	@PostMapping("update/{id}")
	public String update(Product product,@PathVariable("id") int id,@RequestParam("upload_file_product")MultipartFile file) {
		this.upload.handleUpLoadFile(file);
		Product pro=this.productRepo.getOne(id);
		product.setName(product.getName());
		product.setId(id);
		if(file.getOriginalFilename().equals("")) {
			product.setImage(pro.getImage());
		}else {
			product.setImage(file.getOriginalFilename());
		}
		product.setCategory(pro.getCategory());
		product.setCreatedDate(pro.getCreatedDate());
		
		this.productRepo.save(product);
			return "redirect:/admin/products/index";
		}
		
	@PostMapping("store")
	public String store(Product product,
			@RequestParam("cate_id")Integer id,
			@RequestParam("upload_file_product")MultipartFile file,
			Model model) {
		this.upload.handleUpLoadFile(file);
		product.setImage(file.getOriginalFilename());
		Category cate=categoryRepo.getOne(id);
		product.setCategory(cate);
		product.setCreatedDate(new Date());
		this.productRepo.save(product);
		return "redirect:/admin/products/index";
	}

	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Product product) {
		this.productRepo.delete(product);
		return "redirect:/admin/products/index";
	}

	@GetMapping("index")
	public String index(Model model, @RequestParam(name = "page", defaultValue = "0") Integer page,
			@RequestParam(name = "size", defaultValue = "10") Integer size) {
		Pageable pageable = PageRequest.of(page, size);
		Page<Product> data = this.productRepo.findAll(pageable);
		model.addAttribute("data", data);
		model.addAttribute("views", "/views/admin/products/index.jsp");
		return "layout";
	}
}
