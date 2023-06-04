package ride.sharing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ride.sharing.model.dao.mapper.VisitCounterMapper;
import ride.sharing.model.vo.VisitCountVO;
import ride.sharing.service.VisitCounterService;

@Service
public class VisitCounterServiceImpl implements VisitCounterService {

	@Autowired
	private VisitCounterMapper counterMapper;
	
	@Override
    public int insertVisitor(VisitCountVO vo) throws Exception {
    	return counterMapper.insertVisitor(vo);
    }
    
	
}
