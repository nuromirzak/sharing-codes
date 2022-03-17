package codes.sharing.sharingcodes.repository;

import codes.sharing.sharingcodes.model.Code;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CodeRepository extends CrudRepository<Code, String> {

}