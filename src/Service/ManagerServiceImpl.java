package Service;

import java.util.List;

import Dao.Managers;
import Dao.ManagersDAO;

public class ManagerServiceImpl implements ManagerService {

	private ManagersDAO managersDao;

	@Override
	public void update(Managers manager) {
		this.managersDao.merge(manager);
	}

	public ManagersDAO getManagersDao() {
		return managersDao;
	}

	public void setManagersDao(ManagersDAO managersDao) {
		this.managersDao = managersDao;
	}

	@Override
	public Managers findById(int id) {
		return this.managersDao.findById(id);
	}

	@Override
	public List<Managers> findAll() {
		return this.managersDao.findAll();
	}

}
