package org.zerock.controller;

import java.lang.ProcessBuilder.Redirect;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.UserRegisterVO;
import org.zerock.domain.UserUpdateVO;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.UserService;

@Controller
@RequestMapping(value="/user/*")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	UserService service;
	
	@RequestMapping(value="login", method = RequestMethod.GET)
	public void loginGET() throws Exception {
		
	}
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
	   
	   UserVO user = service.findByUserId(dto);
	  
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
	   UserVO login = new UserVO();
	   login.setUid(user.getUid());
	   login.setNickName(user.getNickName());
	   login.setEmail(user.getEmail());
	   session.setAttribute("login", login);
	   logger.info("로그인 성공");

//	   if (dto.isUseCookie()) {
//		   int amount = 60 * 60 * 24 * 7;
//		   Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
//		   service.keepLogin(user.getUid(), session.getId(), sessionLimit);
//		}
	   
	   return "redirect:/";
	}
	
	@RequestMapping(value="logout")
	public String logOut(HttpSession session) throws Exception {
		
		session.removeAttribute("login");
		
		return "redirect:/";
	}
	
	@RequestMapping(value="form", method = RequestMethod.GET)
	public void formGET() {
		logger.info("formGET()...");
	}
	
	@RequestMapping(value="form", method = RequestMethod.POST)
	public String formPOST(UserRegisterVO member, Model model) throws Exception {
		logger.info("formPOST()...");
		//회원정보 등록
		service.register(member);
		return "redirect:/";
	}
	
	@RequestMapping(value="{uid}/form", method = RequestMethod.GET)
	public String formUpdateGET(@PathVariable String uid, Model model) throws Exception {
		logger.info("formUpdateGET()...");
		if (uid == null) {
			throw new IllegalArgumentException("사용자 아이디가 필요합니다.");
		}
		//사용자 정보 불러와서 보여주기
		logger.info("DB에서 사용자정보 가져와서 보여주기");
		LoginDTO dto = new LoginDTO();
		dto.setUid(uid);
		UserVO vo = service.findByUserId(dto);
		model.addAttribute("userInfo", vo);
		
		return "user/form";
	}

	@RequestMapping(value="update", method = RequestMethod.PUT)
	public String formUpdatePUT(UserUpdateVO vo, Model model) throws Exception {
		logger.info("formUpdatePUT()...");
		if (vo.getUpwNew1().equals(vo.getUpwNew2())) {
			service.update(vo);
			logger.info("사용자정보 변경성공");
			return "redirect:/";
		}
		return null;
	}

}




























