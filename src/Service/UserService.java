package Service;

import java.util.List;

import Dao.Users;

public interface UserService {
	public List<Users> findAllUser();

	public void save(Users user);

	public void delete(Users user);

	public void update(Users user);

	public Users findById(int id);

	public List<Users> findByUsername(Object username);
}
