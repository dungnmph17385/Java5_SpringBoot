package Assignment.ultis;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import Assignment.beans.OrderDetailModel;
import Assignment.entities.Product;
import Assignment.repositories.ProductRepository;

public class ShoppingCartServiceImpl implements ShoppingCartService {
	@Autowired
	private ProductRepository productRepo;

	Map<Integer, OrderDetailModel> map = new HashMap<>();

	@Override
	public OrderDetailModel add(Integer id) {
		OrderDetailModel item = map.get(id);

		if (item == null) {
			Product product = this.productRepo.getOne(id);
//			item = this.mapper.convertToDTO(product);

			item.setQuantity(1);
			map.put(id, item);
		} else {
			item.setQuantity(item.getQuantity() + 1);
		}

		return item;
	}

	@Override
	public void remove(Integer id) {
		map.remove(id);

	}

	@Override
	public OrderDetailModel update(Integer id, int qty) {
		Product product = this.productRepo.getOne(id);
		if(product.getAvailable() < qty) {
			
		}
		OrderDetailModel item = map.get(id);
		item.setQuantity(qty);
		
		if (item.getQuantity() <= 0) {
			map.remove(id);
		}
		return item;
	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public Collection<OrderDetailModel> getItems() {
		return map.values();
	}

	@Override
	public int getCount() {
		return map.values().stream().mapToInt(item -> item.getQuantity()).sum();
	}

	@Override
	public double getAmount() {
		return  map.values().stream().mapToDouble(item -> item.getPrice()*item.getQuantity()).sum();
	}

}
