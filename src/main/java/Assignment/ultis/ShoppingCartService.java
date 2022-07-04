package Assignment.ultis;

import java.util.Collection;

import Assignment.beans.OrderDetailModel;

public interface ShoppingCartService {
	OrderDetailModel add(Integer id);
	/**
	* Xóa mặt hàng khỏi giỏ
	* @param id mã mặt hàng cần xóa
	*/
	void remove(Integer id);
	/**
	* Thay đổi số lượng lên của mặt hàng trong giỏ
	* @param id mã mặt hàng
	* @param qty số lượng mới
	* @return mặt hàng đã được thay đổi số lượng
	*/
	OrderDetailModel update(Integer id, int qty);
	/**
	* Xóa sạch các mặt hàng trong giỏ
	*/
	void clear();
	/**
	* Lấy tất cả các mặt hàng trong giỏ
	*/
	Collection<OrderDetailModel> getItems();
	/**
	* Lấy tổng số lượng các mặt hàng trong giỏ
	*/
	int getCount();
	/**
	* Lấy tổng số tiền tất cả các mặt hàng trong giỏ
	* */
	double getAmount();
}
