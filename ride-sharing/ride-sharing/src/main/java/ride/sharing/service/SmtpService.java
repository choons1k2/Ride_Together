package ride.sharing.service;

import ride.sharing.model.vo.SmtpVO;


public interface SmtpService {


	public Integer smtpUpdate(SmtpVO stSmtpVO)  throws Exception;

	public SmtpVO getSmtpInfo(Integer sid) throws Exception;
	
}
