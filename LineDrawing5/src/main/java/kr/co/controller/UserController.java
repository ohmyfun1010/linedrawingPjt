package kr.co.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.beans.UserBean;
import kr.co.service.UserService;
import kr.co.validator.UserValidator;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;

	@GetMapping("/join")
	public String join(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		return "user/join";
	}

	@PostMapping("/join_pro")
	public String join_pro(@Valid @ModelAttribute("joinUserBean") UserBean joinUserBean, BindingResult result) {
		if (result.hasErrors()) {
			return "user/join";
		}
		userService.addUserInfo(joinUserBean);
		return "user/join_success";
	}

	@GetMapping("/login")
	public String login(@ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean,
			@RequestParam(value = "fail", defaultValue = "false") boolean fail, Model model) {

		model.addAttribute("fail", fail);
		return "user/login";
	}

	@PostMapping("/login_pro")
	public String login_pro(@Valid @ModelAttribute("tempLoginUserBean") UserBean tempLoginUserBean,
			BindingResult result) {
		if (result.hasErrors()) {
			return "user/login";
		}
		userService.getLoginUserInfo(tempLoginUserBean);
		if (loginUserBean.isUserLogin() == true) {
			return "user/login_success";
		} else {
			return "user/login_fail";
		}

	}

	@GetMapping("/logout")
	public String logout(@ModelAttribute("joinUserBean") UserBean joinUserBean) {
		loginUserBean.setUserLogin(false);
		loginUserBean.setUser_name(null);
		loginUserBean.setUser_idx(0);
		return "user/logout";
	}

	@GetMapping("/not_login")
	public String not_login() {
		return "user/not_login";
	}

	@GetMapping("/user_info")
	public String user_info(Model model) {
		UserBean userinfo = userService.userinfo();
		System.out.println(userinfo.getUser_name());
		System.out.println(userinfo.getUser_id());
		System.out.println(userinfo.getUser_pw());
		model.addAttribute("userinfo", userinfo);
		return "user/user_info";
	}

	@GetMapping("/user_info_delete")
	public String user_info_delete() {
		userService.userinfodelete();
		loginUserBean.setUserLogin(false);
		loginUserBean.setUser_name(null);
		loginUserBean.setUser_idx(0);
		return "user/user_info_delete_success";
	}

	@GetMapping("/pw_change")
	public String pw_change(@ModelAttribute("modifyUserBean") UserBean modifyUserBean, Model model) {
		UserBean userinfo = userService.userinfo();
		modifyUserBean.setUser_name(userinfo.getUser_name());
		modifyUserBean.setUser_id(userinfo.getUser_id());
		return "user/pw_change";
	}

	@PostMapping("/user_modify_pro")
	public String user_modify_pro(@Valid @ModelAttribute("modifyUserBean") UserBean modifyUserBean,BindingResult result) {

		System.out.println(modifyUserBean.getUser_pw());
		if(result.hasErrors())
		{
			return "user/pw_change";
		}
		userService.userinfomodify(modifyUserBean);
		return "user/modify_success";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		UserValidator validator1 = new UserValidator();
		binder.addValidators(validator1);
	}
}
