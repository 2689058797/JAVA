package Dao;

public class Page {

	private static final int DEFAULT_PAGE_SIZE = 6;

	private static final int DEFAULT_CURRENT_PAGE = 1;

	private int currentPage;// 当前页数，通常在Action层设置

	private int pageSize;// 每页记录数，通常在Action层设置

	private int totalCount;// 总记录数，在DAO层设置

	public Page(int currentPage, int pageSize) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
	}

	public Page(int currentPage) {
		this.currentPage = currentPage;
		this.pageSize = DEFAULT_PAGE_SIZE;
	}

	public Page() {
		this.currentPage = DEFAULT_CURRENT_PAGE;
		this.pageSize = DEFAULT_PAGE_SIZE;
	}

	public int getFirstIndex() {
		return pageSize * (currentPage - 1);
	}

	public boolean hasPrevious() {
		return currentPage > 1;
	}

	public boolean hasNext() {
		return currentPage < getTotalPage();
	}

	public int getTotalPage() {

		long remainder = totalCount % this.getPageSize();

		if (0 == remainder) {
			return totalCount / this.getPageSize();
		}

		return totalCount / this.getPageSize() + 1;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
}