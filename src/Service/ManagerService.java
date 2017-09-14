package Service;

import java.util.List;

import Dao.Managers;

public interface ManagerService {
	public void update(Managers manager);

	public List<Managers> findAll();

	public Managers findById(int id);
}
