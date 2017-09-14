package Service;

import java.util.List;

import Dao.Shopcar;
import Dao.ShopcarDAO;
import Dao.Users;

public class ShopCarServiceImpl implements ShopCarService {

	private ShopcarDAO shopCarDao;

	public ShopcarDAO getShopCarDao() {
		return shopCarDao;
	}

	public void setShopCarDao(ShopcarDAO shopCarDao) {
		this.shopCarDao = shopCarDao;
	}

	@Override
	public List<Shopcar> findAllItems(Users users) {
		return this.shopCarDao.findByProperty("users", users);
	}

	@Override
	public void delete(Shopcar shopCar) {
		this.shopCarDao.delete(shopCar);
	}

	@Override
	public void save(Shopcar shopCar) {
		System.out.println(shopCar.getAddDate());
		this.shopCarDao.save(shopCar);

	}

}
