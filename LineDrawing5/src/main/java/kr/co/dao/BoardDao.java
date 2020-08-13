package kr.co.dao;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.beans.NoticeContentBean;
import kr.co.beans.PageBean;
import kr.co.beans.ReviewContentBean;
import kr.co.beans.SearchBean;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void addNoticeContentInfo(NoticeContentBean WriteNoticeContentBean) {
		sqlSessionTemplate.insert("board.addNoticeContentInfo",WriteNoticeContentBean);	
	}
	public List<NoticeContentBean> getNoticeContentList(PageBean pageBean){
		System.out.println(pageBean.getStart());
		System.out.println(pageBean.getEnd());
		return sqlSessionTemplate.selectList("board.getNoticeContentList",pageBean);
	}
	public int noticeDataCount() {
		return sqlSessionTemplate.selectOne("board.noticeDataCount");
	}
	public NoticeContentBean getNoticeContentInfo(int content_idx)
	{
		return sqlSessionTemplate.selectOne("board.getNoticeContentInfo",content_idx);
	}
	public void deleteNoticeContent(int content_idx)
	{
		sqlSessionTemplate.delete("board.deleteNoticeContent",content_idx);
	}
	public void modifyNoticeContent(NoticeContentBean modifyNoticeContentBean)
	{
		sqlSessionTemplate.update("board.modifyNoticeContent", modifyNoticeContentBean);
	}
	
	/* review board */
	
	
	public void addReviewContentInfo(ReviewContentBean WriteReviewContentBean) {
		sqlSessionTemplate.insert("board.addReviewContentInfo",WriteReviewContentBean);	
	}
	public List<ReviewContentBean> getReviewContentList(PageBean pageBean){
		System.out.println(pageBean.getStart());
		System.out.println(pageBean.getEnd());
		return sqlSessionTemplate.selectList("board.getReviewContentList",pageBean);
	}
	public ReviewContentBean getReviewContentInfo(int content_idx) {
		return sqlSessionTemplate.selectOne("board.getReviewContentInfo",content_idx);
	}
	public void modifyReviewContent(ReviewContentBean modifyReviewContentBean)
	{
		sqlSessionTemplate.update("board.modifyReviewContent", modifyReviewContentBean);
	}
	public void deleteReviewContent(int content_idx)
	{
		sqlSessionTemplate.delete("board.deleteReviewContent",content_idx);
	}
	public int reviewDataCount() {
		return sqlSessionTemplate.selectOne("board.reviewDataCount");
	}
	
	/* 검색부분 */
	public List<ReviewContentBean> searchReviweContent(SearchBean searchBean)
	{
		return sqlSessionTemplate.selectList("board.searchReviweContent",searchBean);
	}
	public int searchreviewDataCount(String content_writer_name) {
		return sqlSessionTemplate.selectOne("board.searchreviewDataCount",content_writer_name);
	}
	
}
