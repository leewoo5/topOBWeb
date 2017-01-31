package org.zerock.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.Member_ob;
import org.zerock.domain.Msg;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.dto.IndustryGraphDTO;
import org.zerock.dto.JobGraphDTO;
import org.zerock.dto.MemberDTO_ob;
import org.zerock.dto.OverviewDTO;
import org.zerock.service.MemberService_ob;

@Controller
@RequestMapping(value = "/obmember/*")
public class OBMemberController {

	private static final Logger logger = LoggerFactory.getLogger(OBMemberController.class);

	@Inject
	MemberService_ob service;
	Member_ob member;
	Msg msg = new Msg();

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public void formGET() {
	}

	@RequestMapping(value = "/formPost", method = RequestMethod.POST)
	public String formPOST(MemberDTO_ob info, Model model) throws Exception {
		logger.info("formPOST()...");
		String upw = info.getUpw();
		String upwCheck = info.getUpwCheck();
		info.setPosition("m");
		info.setActive(1);
		info.setRights("n");
		if (upw.equals(upwCheck)) {
			logger.info(info.toString());
			service.register(info);
			msg.setMsg("회원가입이 완료되었습니다.");
			model.addAttribute("result", msg);
		}else{
			msg.setMsg("비밀번호가 일치하지 않습니다");
			model.addAttribute("pwError", msg);
			return "/obmember/form";
		}
		return null;
	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		OverviewDTO view = service.overview();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));

		model.addAttribute("overview", view);
		model.addAttribute("manager", service.getManager());
		model.addAttribute("list", service.listSearch(cri));
		model.addAttribute("pageMaker", pageMaker);
	   
		//직무그래프
		JobGraphDTO job = service.jobGraph();
		int val1 = job.getMarketing(); //마케팅 값
	    int val2 = job.getFinance(); //재무 값
	    int val3 = job.getAd(); //광고 값
	    int val4 = job.getHr(); //인사 값
	    int val5 = job.getSales(); //영업 값
	    int val6 = job.getEtc(); //기타 값
	    String col1 = "#2d5986";
	    String col2 = "#008080";
	    String col3 = "#996633";
	    String col4 = "#b30000";
	    String col5 = "#6b00b3";
	    String col6 = "#4d4d4d";
	    String field1 = "마케팅";
	    String field2 = "재무";
	    String field3 = "광고";
	    String field4 = "인사";
	    String field5 = "영업";
	    String field6 = "기타";
	    int width = 30;
	    int radius = 50;
	    int charWidth = 300;
	    int charHeight = 200;
	    
	    String dataset = "{'dataset':{";
	    String title = "title:'직무별 회원 분포',";
	    String values = "values:["+val1+","+val2+","+val3+","+val4+","+val5+","+val6+"],";
	    String colorset = "colorset:["+"'"+col1+"'"+","+"'"+col2+"'"+","+"'"+col3+"'"+","+"'"+col4+"'"+","+"'"+col5+"'"+","+"'"+col6+"'"+"],";
	    String fields = "fields:["+"'"+field1+"'"+","+"'"+field2+"'"+","+"'"+field3+"'"+","+"'"+field4+"'"+","+"'"+field5+"'"+","+"'"+field6+"'"+"]},";
	    String donut_width = "'donut_width':"+width+",";
	    String core_circle_radius = "'core_circle_radius':"+radius+",";
	    String chartDiv = "'chartDiv':'chart_d1',";
	    String chartType = "'chartType':'donut',";
	    String chartSize = "'chartSize':{width:"+charWidth+","+"height:"+charHeight+"}};";
	   
	    String jobString = dataset+title+values+colorset+fields+donut_width+core_circle_radius+chartDiv+chartType+chartSize;
		  
	    model.addAttribute("job", jobString);
	    
	    IndustryGraphDTO industry = service.industryGraph(); 
	    int val1_d2 = industry.getBeauty(); //뷰티 값
	    int val2_d2 = industry.getIt(); //IT 값
	    int val3_d2 = industry.getAd(); //광고 값
	    int val4_d2 = industry.getFood(); //식품 값
	    int val5_d2 = industry.getCar(); //자동차 값
	    int val6_d2 = industry.getDistribution(); //유통 값
	    int val7_d2 = industry.getEtc(); //기타 값
	    String col1_d2 = "#2d5986";
	    String col2_d2 = "#008080";
	    String col3_d2 = "#996633";
	    String col4_d2 = "#b30000";
	    String col5_d2 = "#6b00b3";
	    String col6_d2 = "#b36b00";
	    String col7_d2 = "#4d4d4d";
	    String field1_d2 = "뷰티";
	    String field2_d2 = "IT";
	    String field3_d2 = "광고";
	    String field4_d2 = "식품";
	    String field5_d2 = "자동차";
	    String field6_d2 = "유통";
	    String field7_d2 = "기타";
	    int width_d2 = 30;
	    int radius_d2 = 50;
	    int charWidth_d2 = 300;
	    int charHeight_d2 = 200;
	    
	    String dataset_d2 = "{'dataset':{";
	    String title_d2 = "title:'직무별 회원 분포',";
	    String values_d2 = "values:["+val1_d2+","+val2_d2+","+val3_d2+","+val4_d2+","+val5_d2+","+val6_d2+","+val7_d2+"],";
	    String colorset_d2 = "colorset:["+"'"+col1_d2+"'"+","+"'"+col2_d2+"'"+","+"'"+col3_d2+"'"+","+"'"+col4_d2+"'"+","+"'"+col5_d2+"'"+","+"'"+col6_d2+"'"+","+"'"+col7_d2+"'"+"],";
	    String fields_d2 = "fields:["+"'"+field1_d2+"'"+","+"'"+field2_d2+"'"+","+"'"+field3_d2+"'"+","+"'"+field4_d2+"'"+","+"'"+field5_d2+"'"+","+"'"+field6_d2+"'"+","+"'"+field7_d2+"'"+"]},";
	    String donut_width_d2 = "'donut_width':"+width_d2+",";
	    String core_circle_radius_d2 = "'core_circle_radius':"+radius_d2+",";
	    String chartDiv_d2 = "'chartDiv':'chart_d2',";
	    String chartType_d2 = "'chartType':'donut',";
	    String chartSize_d2 = "'chartSize':{width:"+charWidth_d2+","+"height:"+charHeight_d2+"}};";
	    
	    String industryString = dataset_d2+title_d2+values_d2+colorset_d2+fields_d2+donut_width_d2+core_circle_radius_d2+chartDiv_d2+chartType_d2+chartSize_d2;
	    
	    model.addAttribute("industry", industryString);
		
	}
	

	@RequestMapping(value = "/memberInfo", method = RequestMethod.GET)
	public void memberInfo(@RequestParam String uid, Model model) {
		Member_ob info = service.read(uid);
		model.addAttribute("data", info);
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void update(@RequestParam String uid, Model model) {
		Member_ob info = service.read(uid);
		model.addAttribute("data", info);
	}

	@RequestMapping(value = "/updatePost", method = RequestMethod.POST)
	public String updatePost(Member_ob info, @RequestParam String preUid, Model model) {
		if (info.getUpwNew().equals(info.getUpwCheck())) {
			if (!info.getUpwNew().equals("")) {
				info.setUpw(info.getUpwNew());
			}
			service.update(preUid, info);
			msg.setMsg("성공적으로 수정되었습니다.");
			model.addAttribute("result", msg);
		}else{
			msg.setMsg("변경할 비밀번호가 일치하지 않습니다.");
			model.addAttribute("pwError", msg);
			model.addAttribute("preUid", preUid);
		}
		return null;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void delete(@RequestParam String uid, Model model) {
		service.delete(uid);
		msg.setMsg("성공적으로 삭제되었습니다.");
		model.addAttribute("result", msg);
	}

}
