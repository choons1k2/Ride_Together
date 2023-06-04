package ride.sharing.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import ride.sharing.config.auth.PrincipalDetails;
import ride.sharing.model.enums.Role;
import ride.sharing.model.vo.BoardVO;
import ride.sharing.model.vo.UserVO;
import ride.sharing.service.BoardService;
import ride.sharing.service.UserService;

@Controller
@Slf4j
public class HomController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private UserService userService;


	@RequestMapping(value = "/")
	public String index(@AuthenticationPrincipal PrincipalDetails userDetails, BoardVO boardVO, Model model, HttpSession session,
			HttpServletRequest request) throws Exception {
		if (userDetails != null) {
			log.info("로그인 정보 userDetails :  {} " + userDetails.getUser());
		}

	
		//rideList 목록 가져오기
		boardVO.setBoardType("ride_together");
		List<BoardVO> rideList = boardService.getMainRideList();
		
		//free 목록 가져오기
		boardVO.setBoardType("free");
		List<BoardVO> freeList = boardService.getMainfreeList();
		

		model.addAttribute("rideList", rideList);
		model.addAttribute("freeList", freeList);		
		return "web/index";
	}
	

	@GetMapping("/signUpConfirm")
	public String signUpConfirm(String email, String authKey, Model model) throws Exception {
		if (email == null || authKey == null || !StringUtils.hasText(email) || !StringUtils.hasText(authKey))
			return "redirect:/";
		log.info("email : {}, authKey : {}", email, authKey);

		UserVO userVO = userService.findByEmail(email);
		// null 이거나 인증완료된 회원은 로그인폼으로
		if (userVO == null || !userVO.getRole().equals(Role.ROLE_GUEST))
			return "redirect:/loginForm";

		if (userVO.getEmailAuthKey().equals(authKey)) {
			userService.guestUpdateRole(email);
			model.addAttribute("msg", "인증 처리완료 되었습니다.");
		} else {
			model.addAttribute("msg", "인증에 처리에 실패하였습니다.");
		}
		return "web/signUpConfirm";
	}
	
	
	

}


