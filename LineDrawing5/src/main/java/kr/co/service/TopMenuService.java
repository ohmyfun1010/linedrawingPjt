package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.beans.BoardInfoBean;
import kr.co.dao.BoardDao;
import kr.co.dao.TopMenuDao;
@Service
public class TopMenuService {
	@Autowired
	private TopMenuDao topMenuDao;
	
	public List<BoardInfoBean> gettopmenulist()
	{
		List<BoardInfoBean> menulist = topMenuDao.gettopmenulist();
		return menulist;
	}
}
