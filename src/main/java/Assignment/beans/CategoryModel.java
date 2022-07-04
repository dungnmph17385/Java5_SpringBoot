package Assignment.beans;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class CategoryModel {
	private int id;
	@NotBlank(message = "Không được để trống")
	private String name;
}
