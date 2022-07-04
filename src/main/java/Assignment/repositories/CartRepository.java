package Assignment.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import Assignment.entities.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer>{
	@Query("SELECT o FROM Cart o WHERE o.product.id=:uid ")
	Cart findByProductId(@Param("uid")Integer id);
	
	@Query("SELECT o FROM Cart o WHERE o.account.id=:uid")
	List<Cart> findAllCartByAccountId(@Param("uid")Integer id);
	
	@Query("SELECT o FROM Cart o WHERE o.account.id=:uid and o.product.id=:pid")
	List<Cart> findCardByProductIdAndAccountId(@Param("uid")Integer idAccount,@Param("pid")Integer productId);
}
