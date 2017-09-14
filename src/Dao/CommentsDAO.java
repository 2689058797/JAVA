package Dao;

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

/**
 * A data access object (DAO) providing persistence and search support for
 * Comments entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see Dao.Comments
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class CommentsDAO {
	private static final Logger log = LoggerFactory
			.getLogger(CommentsDAO.class);
	// property constants
	public static final String CONTENT = "content";

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	public void save(Comments transientInstance) {
		log.debug("saving Comments instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Comments persistentInstance) {
		log.debug("deleting Comments instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	protected List queryForList(String hql, Object[] params, Page page) {
		generatePageTotalCount(hql, params, page);
		Query query = getCurrentSession().createQuery(hql);
		setQueryParams(query, params);
		query.setFirstResult(page.getFirstIndex());
		query.setMaxResults(page.getPageSize());
		return query.list();
	}

	/**
	 * 该方法会改变参数page的totalCount字段
	 * 
	 * @param originHql
	 *            原始hql语句
	 * @param params
	 *            原始参数
	 * @param page
	 *            页面对象
	 */
	private void generatePageTotalCount(String originHql, Object[] params,
			Page page) {
		if (originHql.contains("order")) {
			String a[] = originHql.split("order by");
			originHql = a[0];
		}
		String generatedCountHql = "select count(*) " + originHql;
		Query countQuery = getCurrentSession().createQuery(generatedCountHql);
		setQueryParams(countQuery, params);
		int totalCount = ((Long) countQuery.uniqueResult()).intValue();
		page.setTotalCount(totalCount);
	}

	protected void setQueryParams(Query query, Object[] queryParams) {
		if (queryParams != null && queryParams.length > 0) {
			for (int i = 0; i < queryParams.length; i++) {
				query.setParameter(i, queryParams[i]);
			}
		}
	}

	public Comments findById(java.lang.Integer id) {
		log.debug("getting Comments instance with id: " + id);
		try {
			Comments instance = (Comments) getCurrentSession().get(
					"Dao.Comments", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Comments instance) {
		log.debug("finding Comments instance by example");
		try {
			List results = getCurrentSession().createCriteria("Dao.Comments")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value, Page page) {
		log.debug("finding Comments instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Comments as model where model."
					+ propertyName + "= ? and state = '1'";
			return queryForList(queryString, new Object[] { value }, page);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserAndBook(String userId, String bookId) {
		try {
			String queryString = "from Comments as c where c.users.userId = '"
					+ userId + "' and c.book.bookId='" + bookId + "'";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}

	}

	public List findAll(Page page) {
		log.debug("finding all Comments instances");
		try {
			String queryString = "from Comments where state='0'";
			return queryForList(queryString, new Object[] {}, page);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Comments merge(Comments detachedInstance) {
		log.debug("merging Comments instance");
		try {
			Comments result = (Comments) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Comments instance) {
		log.debug("attaching dirty Comments instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Comments instance) {
		log.debug("attaching clean Comments instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CommentsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CommentsDAO) ctx.getBean("CommentsDAO");
	}
}