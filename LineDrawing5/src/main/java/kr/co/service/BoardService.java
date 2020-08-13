package kr.co.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.beans.NoticeContentBean;
import kr.co.beans.PageBean;
import kr.co.beans.PageButtonBean;
import kr.co.beans.ReviewContentBean;
import kr.co.beans.SearchBean;
import kr.co.beans.UserBean;
import kr.co.dao.BoardDao;

@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao;

	@Resource(name = "tempPageBean")
	@Lazy
	private PageBean pageBean;
	
	@Resource(name = "tempSearchBean")
	@Lazy
	private SearchBean searchBean;

	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;

	private int page_listcnt = 10;
	private int page_paginationcnt = 10;

	@Value("${path.upload}")
	private String path_upload;

	public void addNoticeContentInfo(NoticeContentBean WriteNoticeContentBean) {
		boardDao.addNoticeContentInfo(WriteNoticeContentBean);
	}

	public List<NoticeContentBean> getNoticeContentList(int page) {

		pageBean.setStart(((page - 1) * page_listcnt) + 1);
		pageBean.setEnd(pageBean.getStart() + 9);
		return boardDao.getNoticeContentList(pageBean);

	}

	public PageButtonBean getContentCnt(int currentPage) {
		int content_cnt = boardDao.noticeDataCount();
		PageButtonBean pageButtonBean = new PageButtonBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		return pageButtonBean;
	}

	public NoticeContentBean getNoticeContentInfo(int content_idx) {
		return boardDao.getNoticeContentInfo(content_idx);
	}

	public void deleteNoticeContent(int content_idx) {
		boardDao.deleteNoticeContent(content_idx);
	}

	public void modifyNoticeContent(NoticeContentBean modifyNoticeContentBean) {
		boardDao.modifyNoticeContent(modifyNoticeContentBean);
	}

	/* review board */

	public void addReviewContentInfo(ReviewContentBean WriteReviewContentBean) {
		/*
		 * String path = path_upload; MultipartFile upload_file =
		 * WriteReviewContentBean.getUpload_file(); String uploadoriginalname =
		 * upload_file.getOriginalFilename(); String content_file =
		 * System.currentTimeMillis() + "_" +
		 * uploadoriginalname.substring(uploadoriginalname.lastIndexOf("\\") + 1);
		 * System.out.println(WriteReviewContentBean.getUpload_file());
		 * System.out.println(uploadoriginalname); System.out.println(path);
		 * System.out.println(content_file);
		 * System.out.println(loginUserBean.getUser_idx());
		 * System.out.println(loginUserBean.getUser_name());
		 */
		
		String path = path_upload;
		System.out.println(path);
		MultipartFile upload_file = WriteReviewContentBean.getUpload_file();
		if (upload_file.getSize() > 0) {
			String uploadoriginalname = upload_file.getOriginalFilename();
			String content_file = System.currentTimeMillis() + "_"
					+ uploadoriginalname.substring(uploadoriginalname.lastIndexOf("\\") + 1);
			WriteReviewContentBean.setContent_file(content_file);
			try {
				upload_file.transferTo(new File(path + "/" + content_file));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		WriteReviewContentBean.setContent_writer_idx(loginUserBean.getUser_idx());
		WriteReviewContentBean.setContent_writer_name(loginUserBean.getUser_name());
		
		boardDao.addReviewContentInfo(WriteReviewContentBean);

	}

	public List<ReviewContentBean> getReviewContentList(int page) {
		pageBean.setStart(((page - 1) * page_listcnt) + 1);
		pageBean.setEnd(pageBean.getStart() + 9);
	
		return boardDao.getReviewContentList(pageBean);
	}

	public ReviewContentBean getReviewContentInfo(int content_idx) {
		return boardDao.getReviewContentInfo(content_idx);
	}

	public void modifyReviewContent(ReviewContentBean modifyReviewContentBean) {

		String path = path_upload;
		System.out.println(path);
		MultipartFile upload_file = modifyReviewContentBean.getUpload_file();
		if (upload_file.getSize() > 0) {
			String uploadoriginalname = upload_file.getOriginalFilename();
			String content_file = System.currentTimeMillis() + "_"
					+ uploadoriginalname.substring(uploadoriginalname.lastIndexOf("\\") + 1);
			modifyReviewContentBean.setContent_file(content_file);
			try {
				upload_file.transferTo(new File(path + "/" + content_file));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		boardDao.modifyReviewContent(modifyReviewContentBean);

	}
	
	public void deleteReviewContent(int content_idx)
	{
		boardDao.deleteReviewContent(content_idx);
	}
	public PageButtonBean getreviewContentCnt(int currentPage) {
		int content_cnt = boardDao.reviewDataCount();
		PageButtonBean pageButtonBean = new PageButtonBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		return pageButtonBean;
	}

	/* 검색부분 */
	public List<ReviewContentBean> searchReviweContent(int page,String content_writer_name){
		searchBean.setStart(((page - 1) * page_listcnt) + 1);
		searchBean.setEnd(searchBean.getStart() + 9);
		searchBean.setContent_writer_name(content_writer_name);
		return boardDao.searchReviweContent(searchBean);
	}
	public PageButtonBean getsearchreviewContentCnt(int currentPage,String searchBean) {
		int content_cnt = boardDao.searchreviewDataCount(searchBean);
		System.out.println(content_cnt);
		PageButtonBean pageButtonBean = new PageButtonBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		return pageButtonBean;
	}
}
