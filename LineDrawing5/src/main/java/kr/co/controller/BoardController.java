package kr.co.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.beans.NoticeContentBean;
import kr.co.beans.PageButtonBean;
import kr.co.beans.ReviewContentBean;
import kr.co.beans.UserBean;
import kr.co.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;

	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;

	@GetMapping("/notice")
	public String main(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {

		List<NoticeContentBean> list = boardService.getNoticeContentList(page);
		model.addAttribute("list", list);

		PageButtonBean pageButtonBean = boardService.getContentCnt(page);
		model.addAttribute("pageButtonBean", pageButtonBean);

		String user_name = loginUserBean.getUser_name();
		model.addAttribute("user_name", user_name);
		model.addAttribute("page", page);
		return "board/notice";
	}

	@GetMapping("/notice_write")
	public String notice_write(@ModelAttribute("WriteNoticeContentBean") NoticeContentBean WriteNoticeContentBean,@RequestParam("page") int page,Model model) {
		model.addAttribute("page",page);
		return "board/notice_write";
	}

	@PostMapping("/notice_write_pro")
	public String notice_write_pro(@Valid @ModelAttribute("WriteNoticeContentBean") NoticeContentBean WriteNoticeContentBean,BindingResult result,Model model
			,@RequestParam("page") int page) {
		if(result.hasErrors())
		{
			return "board/notice_write";
		}
		model.addAttribute("page",page);
		boardService.addNoticeContentInfo(WriteNoticeContentBean);
		return "board/notice_write_success";
	}

	@GetMapping("/notice_read")
	public String notice_read(@RequestParam int content_idx, @RequestParam int page, Model model) {
		NoticeContentBean readnoticeContentBean = boardService.getNoticeContentInfo(content_idx);
		String user_name = loginUserBean.getUser_name();
		model.addAttribute("user_name", user_name);
		model.addAttribute("readnoticeContentBean", readnoticeContentBean);
		model.addAttribute("page", page);
		return "board/notice_read";
	}

	@GetMapping("/notice_delete")
	public String notice_delete(@RequestParam("content_idx") int content_idx, Model model) {
		System.out.println(content_idx);
		boardService.deleteNoticeContent(content_idx);
		return "board/notice_delete_success";
	}

	@GetMapping("/notice_modify")
	public String notice_modify(@RequestParam("content_idx") int content_idx, @RequestParam("page") int page,
			@ModelAttribute("modifyNoticeContentBean") NoticeContentBean modifyNoticeContentBean, Model model) {
		NoticeContentBean tempmodifyNoticeContentBean = boardService.getNoticeContentInfo(content_idx);
		modifyNoticeContentBean.setContent_subject(tempmodifyNoticeContentBean.getContent_subject());
		modifyNoticeContentBean.setContent_text(tempmodifyNoticeContentBean.getContent_text());
		modifyNoticeContentBean.setContent_date(tempmodifyNoticeContentBean.getContent_date());
		model.addAttribute("modifyNoticeContentBean", modifyNoticeContentBean);
		model.addAttribute("page",page);
		return "board/notice_modify";
	}

	@PostMapping("/notice_modify_pro")
	public String notice_modify_pro(@Valid @ModelAttribute("modifyNoticeContentBean") NoticeContentBean modifyNoticeContentBean,
					@RequestParam("page") int page,
					Model model,BindingResult result
						) {
		if(result.hasErrors())
		{
			return "board/notice_modify";
		}
		boardService.modifyNoticeContent(modifyNoticeContentBean);
		model.addAttribute("page",page);
		return "board/notice_modify_success";
	}
	
	@GetMapping("/not_writer")
	public String not_writer() {
		return "board/not_writer";
	}

	/* review controller---------------------------------------- */
	@GetMapping("/review")
	public String review(@RequestParam(value = "page", defaultValue = "1") int page,Model model) {
		System.out.println(page);
		List<ReviewContentBean> reviewContentBean = boardService.getReviewContentList(page);
		model.addAttribute("reviewContentBean",reviewContentBean);
		
		PageButtonBean pageButtonBean = boardService.getreviewContentCnt(page);
		model.addAttribute("pageButtonBean", pageButtonBean);
		
		model.addAttribute("page",page);
		return "board/review";
	}
	@GetMapping("/review_write")
	public String review_write(@ModelAttribute("ReviewWriteContentBean") ReviewContentBean ReviewWriteContentBean) {
		return "board/review_write";
	}
	@PostMapping("review_write_pro")
	public String review_write_pro(@Valid @ModelAttribute("ReviewWriteContentBean") ReviewContentBean ReviewWriteContentBean,BindingResult result)
	{
		
		if(result.hasErrors())
		{
			return "board/review_write";
		}
		
			boardService.addReviewContentInfo(ReviewWriteContentBean); 
		
			 

	
		return "board/review_write_success";
	}
	@GetMapping("/review_read")
	public String review_read(@RequestParam int content_idx, Model model) {
		int user_idx = loginUserBean.getUser_idx();
		model.addAttribute("user_idx", user_idx);
		
		ReviewContentBean reviewContentBean = boardService.getReviewContentInfo(content_idx);
		model.addAttribute("reviewContentBean",reviewContentBean);
		return "board/review_read";
	}
	
	@GetMapping("/review_modify")
	public String review_modify(@RequestParam("content_idx") int content_idx, 
			@ModelAttribute("modifyReviewContentBean") ReviewContentBean modifyReviewContentBean, Model model) {
		ReviewContentBean temp =boardService.getReviewContentInfo(content_idx);
		modifyReviewContentBean.setContent_writer_name(temp.getContent_writer_name());
		modifyReviewContentBean.setContent_date(temp.getContent_date());
		modifyReviewContentBean.setContent_subject(temp.getContent_subject());
		modifyReviewContentBean.setContent_text(temp.getContent_text());
		modifyReviewContentBean.setContent_file(temp.getContent_file());
		modifyReviewContentBean.setContent_idx(content_idx);
		
		System.out.println(modifyReviewContentBean.getContent_file());
		model.addAttribute("modifyReviewContentBean",modifyReviewContentBean);
		
		return "board/review_modify";
	}
	@PostMapping("/review_modify_pro")
	public String review_modify_pro(@Valid @ModelAttribute("modifyReviewContentBean") ReviewContentBean modifyReviewContentBean,
					Model model,BindingResult result
						) {
		if(result.hasErrors())
		{
			return "board/review_modify";
		}
		boardService.modifyReviewContent(modifyReviewContentBean);
		return "board/review_modify_success";
	}
	
	@GetMapping("/review_delete")
	public String review_delete(@RequestParam("content_idx") int content_idx, Model model) {
		boardService.deleteReviewContent(content_idx);
		return "board/review_delete_success";
	}

	/* 검색부분 */
	@GetMapping("/search_pro")
	public String search_pro(@RequestParam("content_writer_name") String content_writer_name, Model model,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "searchpage", defaultValue = "1") int searchpage) {
		System.out.println(content_writer_name);
		List<ReviewContentBean> reviewContentBean = boardService.searchReviweContent(page,content_writer_name);
		model.addAttribute("reviewContentBean",reviewContentBean);
		
		PageButtonBean pageButtonBean = boardService.getsearchreviewContentCnt(page, content_writer_name);
		model.addAttribute("pageButtonBean", pageButtonBean);
		
		model.addAttribute("page",page);
		model.addAttribute("searchpage",searchpage);
		model.addAttribute("content_writer_name",content_writer_name);
		return "board/searchreview";
	}

}
