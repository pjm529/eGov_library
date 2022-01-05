package library.common.page;

public class Criteria {

	private int page; // 현재 페이지

	private int amount; // 한 페이지 당 보여질 게시물 갯수

	private int skip;

	private String keyword;

	private String type;

	public Criteria() {
		this(1, 10);
		this.skip = 0;
	}

	public Criteria(int page, int amount) {
		this.page = page;
		this.amount = amount;
		this.skip = (page - 1) * amount;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.skip = (page - 1) * this.amount;
		this.page = page;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.skip = (this.page - 1) * amount;
		this.amount = amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", amount=" + amount + ", skip=" + skip + ", keyword=" + keyword + ", type="
				+ type + "]";
	}

}
