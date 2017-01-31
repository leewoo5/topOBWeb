package org.zerock.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.Msg;
import org.zerock.dto.LoginDTO;
import org.zerock.service.MemberService_ob;

@Controller
@RequestMapping(value="/user/*")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	MemberService_ob service;
	Msg msg = new Msg();
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void loginGET() throws Exception {

	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
	   logger.info("#######################");	
	   LoginDTO login = service.findByUserId(dto);
	  
	   if (login == null) {
		   logger.info("존재하지 않는 아이디");
		   model.addAttribute("errorId", "존재하지 않는 아이디 입니다.");
		   return "user/login";
	   }
	   if(!dto.getUpw().equals(login.getUpw())){
		   logger.info("잘못된 비밀번호");
		   model.addAttribute("errorPw", "비밀번호가 틀립니다.");
		   return "user/login";
	   }
	   login.setUpw("****");
	   model.addAttribute("login", login);
	   msg.setMsg("로그인이 성공했습니다");
	   model.addAttribute("result", msg);
	   return null;
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public void logoutGET(HttpSession session, Model model){
		Object obj = session.getAttribute("login");
		if (obj != null) {
		  session.removeAttribute("login");
		  session.invalidate();
		  model.addAttribute("result", "success");
		  
		}
	}

}
