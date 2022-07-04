package Assignment.beans;

import javax.validation.constraints.Email;
import javax.validation.constraints.Null;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class AccountModel {
	
	private int id;
	@NotBlank(message = "Không được để trống")
	private String username;
	@NotBlank(message = "Không được để trống")
	private String password;
	@NotBlank(message = "Không được để trống")
	private String fullname;
	@NotBlank(message = "Không được để trống")
	@Email
	private String email;
	@Null
	private String photo;
	private int activated;
	private int admin;
}
