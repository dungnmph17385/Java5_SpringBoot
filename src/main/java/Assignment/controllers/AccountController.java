package Assignment.controllers;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Assignment.beans.AccountModel;
import Assignment.entities.Account;
import Assignment.repositories.AccountRepository;
import Assignment.ultis.EncryptUtil;
import Assignment.ultis.UploadFileUtils;

@Controller
@RequestMapping("/admin/accounts")
public class AccountController {
	@Autowired
	private AccountRepository accountRepo;
	@Autowired
	private UploadFileUtils uploadUtil;
	@Autowired
	HttpServletRequest request;

	public void check(Model model, Account account) {
		HttpSession session = request.getSession();
		account = (Account) session.getAttribute("account");
		if (account != null) {
			model.addAttribute("account", account);
		}
	}

	@GetMapping("create")
	public String create(Model model, @ModelAttribute("account") Account acc) {

		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("account");
			model.addAttribute("views", "/views/admin/accounts/create.jsp");
			return "layout";
	}

	@GetMapping("edit/{id}")
	public String edit(Model model, @ModelAttribute("account") Account acc, @PathVariable("id") Integer id) {
		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("account");
			acc = accountRepo.getOne(id);
			model.addAttribute("views", "/views/admin/accounts/edit.jsp");
			model.addAttribute("account", acc);
			return "layout";
	}

	@PostMapping("update/{id}")
	public String update(@ModelAttribute("account") Account account, @PathVariable("id") int id,
			@RequestParam("upload_file") MultipartFile uploadFile) {
		account.setPhoto(uploadFile.getOriginalFilename());
		Account acc = this.accountRepo.getOne(id);
		File a = this.uploadUtil.handleUpLoadFile(uploadFile);
		account.setId(id);
		account.setPassword(acc.getPassword());
		accountRepo.save(account);
		return "redirect:/admin/accounts/index";

	}

	@PostMapping("/store")
	public String store(Model model, @ModelAttribute("account") Account account,
			@RequestParam("upload_file") MultipartFile uploadFile) {

		account.setPhoto(uploadFile.getOriginalFilename());
		String hashedPassword = EncryptUtil.hash(account.getPassword());
		account.setPassword(hashedPassword);
		File a = this.uploadUtil.handleUpLoadFile(uploadFile);

		this.accountRepo.save(account);
		return "redirect:/admin/accounts/index";

	}

	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Account account) {
		this.accountRepo.delete(account);
		return "redirect:/admin/accounts/index";
	}

	@GetMapping("index")
	public String index(Model model, @RequestParam(name = "page", defaultValue = "0") Integer page,
			@RequestParam(name = "size", defaultValue = "10") Integer size) {
		Pageable pageable = PageRequest.of(page, size);
		Page<Account> data = this.accountRepo.findAll(pageable);
		model.addAttribute("data", data);
		model.addAttribute("views", "/views/admin/accounts/index.jsp");
		return "layout";
	}
}
