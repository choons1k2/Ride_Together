package ride.sharing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import ride.sharing.config.auth.PrincipalDetails;
import ride.sharing.model.vo.ScrapVO;
import ride.sharing.service.ScrapService;

@Controller
@RequestMapping("/scrap")
@Slf4j
public class ScrapController {

	@Autowired
	private ScrapService scrapService;
	
	
	@PostMapping("/insertScrap")
	public ResponseEntity<?> insertScrap(@AuthenticationPrincipal PrincipalDetails principalDetails,ScrapVO scrapVO) throws Exception{
		scrapVO.setUid(principalDetails.getUser().getUid());
		
		log.info(" log : ", scrapVO.toString());
		scrapService.insertScrap(scrapVO);
		return ResponseEntity.status(HttpStatus.OK).body("success");
	}
	
	
	
		
	
}
