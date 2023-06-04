package ride.sharing.service;

import javax.servlet.http.HttpServletRequest;

import ride.sharing.model.vo.UserVO;

public interface EmailAuthenticationService {

	
	public String emailSend(UserVO userVO, HttpServletRequest request ) throws Exception;
		

	public String emailSendId(UserVO userVO, HttpServletRequest request ) throws Exception;


	public String emailSendPassword(UserVO user, HttpServletRequest request) throws Exception;
	
}

