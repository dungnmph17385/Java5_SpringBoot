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
public class OrderDetailModel {
 private int id;
 private int order_id;
 private int product_id;
// @NotBlank(message = "Không được để trống")
 private float price;
// @NotBlank(message = "Không được để trống")
 private int quantity;
}
