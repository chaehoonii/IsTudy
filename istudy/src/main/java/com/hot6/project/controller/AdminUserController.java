package com.hot6.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.AdminUserService;
import com.hot6.project.vo.AdminUserVO;
import com.hot6.project.vo.BoardVO;
import com.hot6.project.vo.PagingVO;
import com.hot6.project.vo.UserVO;

@Controller
@RequestMapping("/admin/")
public class AdminUserController {

	@Inject
	AdminUserService AUservice;

	@GetMapping("adminUsers")
	public ModelAndView adminUser(@RequestParam(name = "permission", defaultValue = "all") String permission,
			String want, PagingVO pvo, HttpSession session) {

		System.out.println(permission);

		System.out.println(want);

		ModelAndView mav = new ModelAndView();

		String id = (String) session.getAttribute("logId");

		String nickName = (String) session.getAttribute("logNickname");

		mav.addObject("id", id);

		mav.addObject("nickName", nickName);

		// 해당 레코드 수
		int allCnt = AUservice.getAllCnt(permission, want, pvo);
		System.out.println(allCnt);
		pvo.setTotalRecord(allCnt);

		mav.addObject("users", AUservice.getUserInfo(permission, want, pvo));

		if (pvo.getSearchWord() != null) {
			mav.addObject("word", pvo.getSearchWord());
		}

		// 일반 회원수
		mav.addObject("userCnt", AUservice.getPermissionCnt("user", null));
		// 멘토 회원수
		mav.addObject("mentorCnt", AUservice.getPermissionCnt("mentor", null));
		// 관리자 수
		mav.addObject("adminCnt", AUservice.getPermissionCnt("admin", null));


		mav.addObject("pvo", pvo);

		mav.setViewName("admin/adminUsers");

		return mav;
	}

	@GetMapping("adminReport")
	public ModelAndView adminReport(@RequestParam(name = "confirm",defaultValue = "all") String confirm, PagingVO pvo, HttpSession session) {

	      ModelAndView mav = new ModelAndView();
	      
	      int allReportCnt = AUservice.getAllReportPagingCnt(confirm, pvo); 
	      pvo.setTotalRecord(allReportCnt);
	      
	      if (pvo.getSearchWord() != null) {
	         mav.addObject("word", pvo.getSearchWord());
	      }
	      
	      mav.addObject("adminReport", AUservice.getAdminUserInfo(confirm, pvo));
	      mav.addObject("allReportCnt", AUservice.getAllReportCnt(confirm, pvo));
	      mav.addObject("standbyReportCnt", AUservice.getStandbyReportCnt());
	      mav.addObject("confirmReportCnt", AUservice.getConfirmReportCnt());
	      mav.addObject("pvo", pvo);
	      mav.setViewName("admin/adminReport");

	      return mav;
	   }
	
	// 신고 관리 확인
	@GetMapping("confirmUpdate")
	   public String confirmUpdate(HttpSession session,@RequestParam("report_num") int report_num) {
	      AdminUserVO vo=new AdminUserVO();
	      vo.setReport_num(report_num);
	      System.out.println(vo.getReport_num());
	      AUservice.getConfirmUpdate(vo);
	      return "redirect:/";
	}
	
	 // 신고된 글 계정 삭제
	@GetMapping("adminDelete")
	   public String adminDelete(HttpSession session,@RequestParam("report_num") int report_num) {
	      AdminUserVO vo=new AdminUserVO();
	      vo.setReport_num(report_num);
	      System.out.println(vo.getReport_num());
	      AUservice.getAdminDelete(vo);
	      return "redirect:/";
	   }

	@ResponseBody // Ajax
	@RequestMapping(value = "report_writing_Modal", method = RequestMethod.GET)
	public BoardVO ReportWritingModal(@RequestParam("board_num") int board_num) {
		return AUservice.getReportWritingModal(board_num);
	}

	@ResponseBody // Ajax
	@RequestMapping(value = "report_content_Modal", method = RequestMethod.GET)
	public AdminUserVO ReportContentModal(@RequestParam("report_num") int report_num) {
		return AUservice.getReportContentModal(report_num);
	}

	// 멘토 신청 승인
	@PostMapping("approveUser")
	public ModelAndView approveUser(UserVO vo) {

		ModelAndView mav = new ModelAndView();

		AUservice.approveUserStatus(vo);

		mav.setViewName("redirect:adminUsers");

		return mav;

	}

	// 멘토 신청 반려
	@PostMapping("sendBackUser")
	public ModelAndView sendBackUser(UserVO vo) {

		ModelAndView mav = new ModelAndView();

		AUservice.sendBackStatus(vo);

		mav.setViewName("redirect:adminUsers");


		return mav;
	}

}