package Service;

import java.util.List;
import Dao.Purchase;
public interface PurchaseService {
		
	public List<Purchase> findAllPurchase();
	public List<Purchase> findByUserId();
	
	
	public void save(Purchase purchase);
	public void delete(Purchase purchase);
}
