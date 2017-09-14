package Service;

import java.util.List;

import Dao.Purchase;
import Dao.PurchaseDAO;

public class PurchaseServiceImpl implements PurchaseService {
	private PurchaseDAO purchaseDao;
	@SuppressWarnings("unchecked")
	@Override
	public List<Purchase> findAllPurchase() {
		// TODO Auto-generated method stub
		return this.purchaseDao.findAll();
	
	}
	public List<Purchase> findByUserId() {
		// TODO Auto-generated method stub
		return this.purchaseDao.findAll();
	
	}
	@Override
	public void save(Purchase purchase) {
		// TODO Auto-generated method stub
		this.purchaseDao.save(purchase);
	}

	@Override
	public void delete(Purchase purchase) {
		// TODO Auto-generated method stub
		this.purchaseDao.delete(purchase);
	}

	public PurchaseDAO getPurchaseDao() {
		return purchaseDao;
	}

	public void setPurchaseDao(PurchaseDAO purchaseDao) {
		this.purchaseDao = purchaseDao;
	}

}
