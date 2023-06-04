package ride.sharing.model.dao.mapper;

import org.springframework.stereotype.Repository;

import ride.sharing.model.vo.SmtpVO;


@Repository
public interface SmtpMapper {

	public Integer smtpUpdate(SmtpVO stSmtpVO)  throws Exception;

	public SmtpVO getSmtpInfo(Integer sid) throws Exception;
	
	
}
