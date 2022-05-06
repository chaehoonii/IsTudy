package com.hot6.project.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.UserService;
import com.hot6.project.vo.UserVO;

@Controller
@RequestMapping("/users/")
public class UserController {

	@Value("/profiles/")
	private String fileRealPath;

	@Inject
	UserService service;

	// 회원가입 페이지 이동 (김진영_220502)
	@GetMapping("userForm")
	public String userForm() {
		return "users/userForm";
	}

	// 회원등록
	@PostMapping("joinOk")
	public String joinOk(UserVO vo, Model model, @RequestParam("user_img") MultipartFile user_img) {

		Path filePath;
		String pathName;

		// 프로필 이미지 설정 X -> profile 자동설정
		if (user_img.isEmpty()) {
			pathName = "\\profiles\\profile_default.jpg";
			int cnt = service.userInsert(vo, pathName);
			model.addAttribute("cnt", cnt);
			return "users/joinResult";

		}

		// getOriginalFilename();
		filePath = Paths.get(fileRealPath + user_img.getName());

		try {
			Files.write(filePath, user_img.getBytes());
			System.out.println(filePath + "경로에 이미지가 저장됨");
			// getBytes가 이미지 실체고 이걸 파일로 변환해서 저장해야한다.
		} catch (Exception e) {
			e.printStackTrace();
		}
		pathName = "\\profiles\\profileImg";
		int cnt = service.userInsert(vo, pathName);
		model.addAttribute("cnt", cnt);
		return "users/joinResult";
	}

	// 아이디 중복검사
	@PostMapping("userIdCheck")
	@ResponseBody
	public int idCheck(String id) {
		// id가 DB에 존재하는지 확인
		int cnt = service.idCheck(id);
		return cnt;
	}

	// 회원정보수정 폼(임시)
	@GetMapping("userEdit")
	public ModelAndView userEdit(HttpSession session) {
		String id = (String) session.getAttribute("logId");
		UserVO vo = service.userSelect(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("users/userEdit");
		return mav;
	}

}
