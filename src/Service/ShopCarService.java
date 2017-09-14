package Service;

import java.util.List;

import Dao.Shopcar;
import Dao.Users;

public interface ShopCarService {
	public List<Shopcar> findAllItems(Users users);

	public void delete(Shopcar shopCar);

	public void save(Shopcar shopCar);
}
