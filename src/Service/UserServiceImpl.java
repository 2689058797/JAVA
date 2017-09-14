package Service;

import java.util.List;

import Dao.Users;
import Dao.UsersDAO;

public class UserServiceImpl implements UserService {

	public UsersDAO userDao;

	public UsersDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(UsersDAO userDao) {
		this.userDao = userDao;
	}

	public void delete(Users user) {
		this.userDao.delete(user);
	}

	@SuppressWarnings("unchecked")
	public List<Users> findAllUser() {
		return this.userDao.findAll();
	}

	public void save(Users user) {
		this.userDao.save(user);
	}

	public void update(Users user) {
		this.userDao.merge(user);
	}

	@Override
	public List<Users> findByUsername(Object username) {
		return this.userDao.findByUsername(username);
	}

	@Override
	public Users findById(int id) {
		return this.userDao.findById(id);
	}

}