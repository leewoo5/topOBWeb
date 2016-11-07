package org.zerock.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.service.UserService;

@Controller
@RequestMapping(value="/user/*")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	UserService service;
	
	@RequestMapping(value="login", method = RequestMethod.GET) 
	public void loginGET() throws Exception {
		
	}
	@RequestMapping(value="login", method = RequestMethod.POST) 
	public void loginPOST() throws Exception {
		
	}
	@RequestMapping(value="logout", method = RequestMethod.GET) 
	public void logout() throws Exception {
		
	}
	
	
}




























