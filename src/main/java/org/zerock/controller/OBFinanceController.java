package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;
import javax.xml.ws.RequestWrapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.Msg;
import org.zerock.domain.OBFinance_inout;
import org.zerock.domain.OBfinanceSC;
import org.zerock.domain.PageMaker;
import org.zerock.domain.PageMakerOBfinance;
import org.zerock.dto.OBFinanceDTO_inout;
import org.zerock.dto.OBFinanceResultDTO;
import org.zerock.service.OBFinanceService;

@Controller
@RequestMapping(value="/obfinance/*")
public class OBFinanceController {
  private static final Logger logger = LoggerFactory.getLogger(OBFinanceController.class);
  @Inject OBFinanceService service;
  Msg msg = new Msg();
  
  @RequestMapping(value = "/listAll", method = RequestMethod.GET)
  public void listAll(@ModelAttribute("cri") OBfinanceSC cri, Model model) {
	List<OBFinance_inout> data;
	try {
		data = service.listSearchCriteria(cri);
		OBFinanceResultDTO result = service.result(cri);
		//데이터 리스트에 수입과 지출이 둘 다 있어야 함. 서비스 사용시 테스트로 하나씩 등록하고 수정하는 방법사용
		   if (data.isEmpty()) {
			   model.addAttribute("list", null);
		   }else{
			   model.addAttribute("list", data);
		   }
		   PageMakerOBfinance pageMaker = new PageMakerOBfinance();
		   pageMaker.setCri(cri);
		   pageMaker.setTotalCount(service.listSearchCount(cri));
		   model.addAttribute("pageMaker", pageMaker);
		   model.addAttribute("result", service.result(cri));
		   int val1 = result.getInputSum();
		   int val2 = result.getOutputSum();
		   String col1 = "#2BC8C9";
		   String col2 = "#FF8C00";
		   String field1 = "수입";
		   String field2 = "지출";
		   int width = 30;
		   int radius = 50;
		   int charWidth = 300;
		   int charHeight = 200;
		   
		   String dataset = "{'dataset':{";
		   String title = "title:'Web accessibility status',";
		   String values = "values:["+val1+","+val2+"],";
		   String colorset = "colorset:["+"'"+col1+"'"+","+"'"+col2+"'"+"],";
		   String fields = "fields:["+"'"+field1+"'"+","+"'"+field2+"'"+"]},";
		   String donut_width = "'donut_width':"+width+",";
		   String core_circle_radius = "'core_circle_radius':"+radius+",";
		   String chartDiv = "'chartDiv':'chart_d',";
		   String chartType = "'chartType':'donut',";
		   String chartSize = "'chartSize':{width:"+charWidth+","+"height:"+charHeight+"}};";
		   
		   String graph = dataset+title+values+colorset+fields+donut_width+core_circle_radius+chartDiv+chartType+chartSize;
			  
		   model.addAttribute("graph", graph);
	} catch (Exception e) {
		e.printStackTrace();
	}
  }
  
  @RequestMapping(value = "/incomeExpenseInfo", method = RequestMethod.GET)
  public void incomeExpenseInfo(@RequestParam String bno, Model model) {
	  try {
		model.addAttribute("data", service.read_incomeExpense(bno));
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
  
  @RequestMapping(value = "/register_incomeExpense", method = RequestMethod.GET)
  public void register_incomeExpenseInfo() {
  }
  @RequestMapping(value = "/registerPost_incomeExpense", method = RequestMethod.POST)
  public void registerPost_incomeExpenseInfo(OBFinance_inout inout, Model model) {
	  try {
		service.register_incomeExpense(inout);
		msg.setMsg("등록이 완료되었습니다.");
		model.addAttribute("result", msg);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	  
  }
  @RequestMapping(value = "/update_incomeExpense", method = RequestMethod.GET)
  public void update_incomeExpense(String bno, Model model) {
	  OBFinance_inout inout;
	try {
		inout = service.read_incomeExpense(bno);
		model.addAttribute("data", inout);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
  
  @RequestMapping(value = "/updatePost_incomeExpense", method = RequestMethod.POST)
  public void update_incomeExpense(OBFinance_inout inout, @RequestParam String bno, Model model){
	  try {
		service.update_incomeExpense(bno, inout);
		msg.setMsg("수정이 완료되었습니다.");
		model.addAttribute("result", msg);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
  @RequestMapping(value = "/delete_incomeExpense_check", method = RequestMethod.GET)
  public void delete_incomeExpense_check(@RequestParam String bno, Model model) {
	  model.addAttribute("data", bno);
  }
  @RequestMapping(value = "/delete_incomeExpense", method = RequestMethod.GET)
  public void delete_incomeExpense(@RequestParam String bno, Model model ) {
	  try {
		service.delete_incomeExpense(bno);
		msg.setMsg("삭제가 완료되었습니다.");
		model.addAttribute("result", msg);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }

}
