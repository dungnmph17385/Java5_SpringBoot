package Assignment.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
//@RequestMapping("/admin/users")
public class HelloController {
//	@Autowired
//	private User user;
//	
//	@Autowired
//	@Qualifier("user_dao_sqlserver")
//	private UserDaoInterface userDao;
//	
//	@RequestMapping(
//		value="/hello",
//		method=RequestMethod.GET
//	)
	@GetMapping("hello")
	public String hello(
		Model model, 
		@RequestParam(name="name") Optional<String> name
	) {
		// Cách 1: defaultValue
		// name = name.length() == 0 ? "IT16308" : name;
		// model.addAttribute("name", name);

		// Cách 2: Optional<T>
		String nameValue = !name.isPresent() ? "IT16308" : name.get();
		model.addAttribute("name", nameValue);
		return "hello";
	}

//	@GetMapping("demo-bean")
//	@ResponseBody
//	public String demoBean()
//	{
//		this.userDao.insert(null);
//		this.userDao.update(null);
//		this.userDao.delete(null);
//		return "Hello, " + this.user.getHoTen();
//	}
}
