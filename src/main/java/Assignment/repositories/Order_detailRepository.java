package Assignment.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import Assignment.entities.OrderDetail;
@Repository
public interface Order_detailRepository extends JpaRepository<OrderDetail, Integer>{

}
