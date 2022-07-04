package Assignment.beans;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class OrderModel {
	private int id;
	private int user_id;
	private Date createdDate;
	@NotBlank(message = "Không được để trống")
	private String address;
}
