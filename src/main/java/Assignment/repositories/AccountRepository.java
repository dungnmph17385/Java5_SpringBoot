package Assignment.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import Assignment.beans.AccountModel;
import Assignment.entities.Account;


@Repository
public interface AccountRepository
	extends JpaRepository<Account, Integer> {
	@Query("SELECT acc FROM Account acc WHERE acc.email=:uemail")
	public Account findByEmail(@Param("uemail")String email);

}
