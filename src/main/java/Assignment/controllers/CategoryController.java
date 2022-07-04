package Assignment.controllers;


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

import Assignment.entities.Category;
import Assignment.repositories.CategoryRepositoy;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {
	@Autowired
	private CategoryRepositoy categoryRepo;

	@GetMapping("/create")
	public String create(Model model, @ModelAttribute("category") Category category) {
		model.addAttribute("views", "/views/admin/category/create.jsp");
		return "layout";
	}

	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id") Integer id, Model model, @ModelAttribute("category") Category cate) {
		cate = categoryRepo.getOne(id);
		model.addAttribute("views", "/views/admin/category/edit.jsp");
		model.addAttribute("category", cate);
		return "layout";
	}

	@PostMapping("/update/{id}")
	public String update(Category category,@PathVariable("id") int id) {
		System.out.println(category.getId());
		System.out.println(category.getName());
		category.setId(id);
		this.categoryRepo.save(category);
		return "redirect:/admin/category/index";

	}

	@PostMapping("/store")
	public String store(Model model,@ModelAttribute("category") Category category) {
		this.categoryRepo.save(category);

		return "redirect:/admin/category/index";

	}

	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Category category) {
		this.categoryRepo.delete(category);
		return "redirect:/admin/category/index";
	}

	@GetMapping("index")
	public String index(Model model, @RequestParam(name = "page", defaultValue = "0") Integer page,
			@RequestParam(name = "size", defaultValue = "10") Integer size) {
		Pageable pageable = PageRequest.of(page, size);
		Page<Category> data = this.categoryRepo.findAll(pageable);
		model.addAttribute("data", data);
		model.addAttribute("views", "/views/admin/category/index.jsp");
		return "layout";
	}
}
