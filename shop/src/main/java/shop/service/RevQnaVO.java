package shop.service;

public class RevQnaVO {
	private int review_qna_idx;
	private int goods_idx;
	private String review_qna_writer;
	private String review_qna_content;
	private String review_qna_subject;
	private String review_qna_regdate;
	private String review_or_qna;
	private int member_idx;
	
	public int getReview_qna_idx() {
		return review_qna_idx;
	}
	public void setReview_qna_idx(int review_qna_idx) {
		this.review_qna_idx = review_qna_idx;
	}
	public int getGoods_idx() {
		return goods_idx;
	}
	public void setGoods_idx(int goods_idx) {
		this.goods_idx = goods_idx;
	}
	public String getReview_qna_writer() {
		return review_qna_writer;
	}
	public void setReview_qna_writer(String review_qna_writer) {
		this.review_qna_writer = review_qna_writer;
	}
	public String getReview_qna_content() {
		return review_qna_content;
	}
	public void setReview_qna_content(String review_qna_content) {
		this.review_qna_content = review_qna_content;
	}
	public String getReview_qna_subject() {
		return review_qna_subject;
	}
	public void setReview_qna_subject(String review_qna_subject) {
		this.review_qna_subject = review_qna_subject;
	}
	public String getReview_qna_regdate() {
		return review_qna_regdate;
	}
	public void setReview_qna_regdate(String review_qna_regdate) {
		this.review_qna_regdate = review_qna_regdate;
	}
	public String getReview_or_qna() {
		return review_or_qna;
	}
	public void setReview_or_qna(String review_or_qna) {
		this.review_or_qna = review_or_qna;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
}
