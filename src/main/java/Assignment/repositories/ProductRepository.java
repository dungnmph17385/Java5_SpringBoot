package Assignment.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Assignment.entities.Product;
@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{
	@Query("SELECT o FROM Product o WHERE o.category.id=:pid")
	List<Product> findByIdPro(@Param("pid")Integer id);
}
