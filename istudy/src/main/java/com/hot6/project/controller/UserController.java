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
import java.security.SecureRandom;
import java.util.Date;
import java.util.Random;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

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
	
	// 회원정보수정 폼
	   @GetMapping("userEdit")
	   public ModelAndView userEdit(HttpSession session) {
	      String id = (String) session.getAttribute("logId");
	      UserVO vo = service.userSelect(id);
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("vo", vo);
	      mav.setViewName("users/userEdit");
	      return mav;
	   }
	   

	// 회원정보 수정
	@PostMapping("userEditOk")
	public ModelAndView userEditOk(UserVO vo, HttpSession session, @RequestParam("user_img") MultipartFile user_img) {
		vo.setUser_id((String) session.getAttribute("logId"));
		ModelAndView mav = new ModelAndView();

		Path filePath;
		String pathName;

		if (user_img.isEmpty()) {
			pathName = "\\profiles\\profile_default.jpg";
			int cnt = service.userUpdate(vo, pathName);
			// mav.setViewName(pathName);
			mav.setViewName("redirect:/");
			// model.addAttribute("cnt", cnt);
			session.setAttribute("logImg", pathName);
			return mav;
		}

		filePath = Paths.get(fileRealPath + user_img.getName() + vo.getUser_id());
		try {
			Files.write(filePath, user_img.getBytes());
			System.out.println(filePath + "경로에 이미지가 저장됨");
			// getBytes가 이미지 실체고 이걸 파일로 변환해서 저장해야한다.
		} catch (Exception e) {
			e.printStackTrace();
		}
		pathName = "\\profiles\\profile_img" + vo.getUser_id();
		service.userUpdate(vo, pathName);

		session.setAttribute("logImg", pathName);
		mav.setViewName("redirect:/");
		return mav;
	}

	// 회원정보삭제
	@GetMapping("userDel")
	public String delete(HttpSession session) {
		String user_id = (String) session.getAttribute("logId");
		service.userDelete(user_id);
		session.invalidate();
		return "redirect:/";
	}

	// 로그인 페이지 이동
	@GetMapping("login")
	public ModelAndView login() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("users/login");
		return mav;
	}

	// 로그인
	@PostMapping("loginOk")
	public ResponseEntity<String> loginOk(UserVO vo, HttpSession session) {

		ResponseEntity<String> entity = null;

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html;charset=utf-8");

		try {
			UserVO user = service.loginCheck(vo);

			if (user != null) {
				session.setAttribute("logId", user.getUser_id());
				session.setAttribute("logNickname", user.getUser_nick());
				session.setAttribute("logName", user.getUser_name());
				session.setAttribute("logStatus", "Y");
				session.setAttribute("logPermission", user.getPermission());

				String msg = "<script>location.href = '/';</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);

			} else {
				throw new Exception();
			}

		} catch (Exception e) {
			e.printStackTrace();

			String msg = "<script>alert('로그인 실패하였습니다.\\n 다시 로그인하세요.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 아이디 찾기 페이지 이동
	@GetMapping("idSearch")
	public ModelAndView idSearch() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("users/idSearch");
		return mav;
	}

	// 아이디 찾기
	@PostMapping("idSearchOk")
	public ResponseEntity<String> idSearchOk(UserVO vo, HttpSession session) {

		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();

		headers.add("Content-Type", "text/html;charset=utf-8");

		try {
			String id = service.findId(vo);

			if (id != null) {
				int length = id.length();
				id = id.substring(0, length - 2);
				id += "**";

				String msg = "<script>alert('회원님의 아이디는" + id + "입니다');location.href = '/users/login';</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);

			} else {
				throw new Exception();
			}
		} catch (Exception e) {
			String msg = "<script>alert('일치하는 회원 정보가 없습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 비밀번호 찾기 페이지 이동
	@GetMapping("pwdSearch")
	public ModelAndView pwdSearch() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("users/pwdSearch");
		return mav;
	}

	@Autowired
	private JavaMailSender emailSender;

	// 비밀번호 찾기
	@PostMapping("pwdSearchOk")
	public ResponseEntity<String> pwdSearchOk(UserVO vo, HttpSession session) {

		ResponseEntity<String> entity = null;

		HttpHeaders headers = new HttpHeaders();

		headers.add("Content-Type", "text/html;charset=utf-8");

		System.out.println(vo.getEmail());

		try {
			// 해당하는 아이디, 이메일 있는지 확인
			int cnt = service.matchUser(vo);

			if (cnt > 0) {
				// 비밀번호 새로 생성
				String newPwd = createPw();
				System.out.println(newPwd);

				// 새로 생성된 비밀번호 update
				service.pwdUpdate(newPwd, vo);
				vo.setUser_pw(newPwd);

				boolean flag = true;
				// 이메일로 비밀번호 전송
				try {
					String email = vo.getEmail();

					MimeMessage mail = emailSender.createMimeMessage();
					MimeMessageHelper message = new MimeMessageHelper(mail, "UTF-8");

					message.setFrom("istudyjoin@gmail.com");
					message.setTo(email);
					message.setSubject("[I sTudy]임시 비밀번호 전송");

					String mailContent = "<h1>IsTudy 임시비밀번호 발급</h1><br/>" + "안녕하세요 " + vo.getUser_id() + "님<br/>"
							+ "임시비밀번호는 " + vo.getUser_pw() + "입니다.<br>" + "Istudy 에 로그인 후 비밀 번호를 변경해 주시기 바랍니다.";
					message.setText(mailContent, true);
					emailSender.send(mail);

				} catch (Exception mailexception) {
					mailexception.printStackTrace();
					System.out.println("메일 발송 실패");
					flag = false;
				}
				if (flag) {
					String msg = "<script>alert('이메일로 회원님의 비밀번호를 전송하였습니다.');location.href = '/users/login';</script>";
					entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
				} else {
					String msg = "<script>alert('이메일 발송을 실패하였습니다');history.back();</script>";
					entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);

				}

			} else {
				throw new Exception();
			}
		} catch (Exception e) {
			e.printStackTrace();
			String msg = "<script>alert('일치하는 회원정보가 없습니다.\\n아이디, 이메일을 다시 확인해 주세요.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	// 로그아웃
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}

	// 비밀번호 난수 생성 함수
	public String createPw() {

		StringBuffer buffer = new StringBuffer();
		SecureRandom rand = new SecureRandom();
		rand.setSeed(new Date().getTime());

		int idx = 0;

		char[] letter = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z' };

		for (int i = 0; i < 10; i++) {
			idx = rand.nextInt(letter.length);
			buffer.append(letter[idx]);
		}
		return buffer.toString();
	}

}