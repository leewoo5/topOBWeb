package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.Main;
import org.zerock.domain.Msg;
import org.zerock.service.MainService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

  private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
  @Inject MainService service;
  
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public String home(Locale locale, Model model) throws Exception {
    logger.info("Welcome home! The client locale is {}.", locale);

    Date date = new Date();
    DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
    String formattedDate = dateFormat.format(date);
    model.addAttribute("serverTime", formattedDate);
    model.addAttribute("data", service.read());
    
    return "home";
  }

  @RequestMapping(value = "/updatePost", method = RequestMethod.POST)
  public void updatePost(Main data, Model model) {
	  data.toString();
	  try {
		service.update(data);
		Msg msg = new Msg();
		msg.setMsg("수정이 완료되었습니다.");
		model.addAttribute("result", msg);
	} catch (Exception e) {
		e.printStackTrace();
	}
  }

}
