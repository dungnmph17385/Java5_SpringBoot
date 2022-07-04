package Assignment.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import Assignment.entities.Category;
@Repository
public interface CategoryRepositoy extends JpaRepository<Category, Integer>{

}
