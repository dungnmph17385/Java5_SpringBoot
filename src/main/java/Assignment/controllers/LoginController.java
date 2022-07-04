package Assignment.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Assignment.beans.AccountModel;
import Assignment.entities.Account;
import Assignment.repositories.AccountRepository;
import Assignment.ultis.EncryptUtil;

@Controller
public class LoginController {
	@Autowired
	private AccountRepository accRepo;
	@Autowired
	private HttpServletRequest request;

	@GetMapping("/auth/login")
	public String getLoginForm(Model model) {
//		return "/auth/login";
		model.addAttribute("views", "/views/auth/login.jsp");
		return "layout";
	}
	

	
	@PostMapping("auth/login")
	public String login(
			@RequestParam("email") String email,
			@RequestParam("password")String password
			) {
		HttpSession session=request.getSession();
		Account account=this.accRepo.findByEmail(email);
		
		System.out.println("-----------------email:"+email);
		boolean checkPW=EncryptUtil.verify(password, account.getPassword());
		if(!checkPW) {
			System.out.println("sai email hoặc mật khẩu");
			return "redirect:/auth/login";
		}else {
			session.setAttribute("account", account);
			return "redirect:/users/home";
		}
	}
	@GetMapping("/logout")
	public String logout() {
		HttpSession session=request.getSession();
		Account user=(Account) session.getAttribute("account");	
		if (user != null) {  
		    session.invalidate();
		    return "redirect:/auth/login";
		}else {
			System.out.println("Đăng xuất không thành công!");
			return "redirect:/users/home";
		}
		
	}
}
