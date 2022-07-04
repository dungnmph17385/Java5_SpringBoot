package Assignment.beans;

import java.util.Date;

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
public class ProductModel {
	private int id;
	@NotBlank(message = "Không được để trống")
	private String name;
//	@Null
	private String image;
//	@NotBlank(message = "Không được để trống")
	private float price;
	private Date created_date;
//	@NotBlank(message = "Không được để trống")
	private int available;
	private int category_id;
}
