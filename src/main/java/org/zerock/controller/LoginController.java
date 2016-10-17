package org.zerock.controller;

import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.User;
import org.zerock.dto.LoginDTO;
import org.zerock.service.UserService;

@Controller
@RequestMapping(value="/user/*")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	UserService service;
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void loginGET() throws Exception {
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
	  
	
	   
	   User user = service.findByUserId(dto);
	  
	   if (user == null) {
		   logger.info("존재하지 않는 아이디");
		   model.addAttribute("errorId", "존재하지 않는 아이디 입니다.");
		   return "/user/login";
	   }
	   if(!dto.getUpw().equals(user.getUpw())){
		   logger.info("잘못된 비밀번호");
		   model.addAttribute("errorPw", "비밀번호가 틀립니다.");
		   return "/user/login";
	   }
	   logger.info("로그인 성공");
	   session.setAttribute("user", user.getNickName());

//	   if (dto.isUseCookie()) {
//		   int amount = 60 * 60 * 24 * 7;
//		   Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
//		   service.keepLogin(user.getUid(), session.getId(), sessionLimit);
//		}
	   
	   return "redirect:/";
	}
	
	@RequestMapping(value = "/logout")
	public String logOut(HttpSession session) throws Exception {
		
		session.removeAttribute("user");
		
		return "redirect:/";
	}

}
