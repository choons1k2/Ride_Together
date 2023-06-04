package ride.sharing.service;

import java.util.List;

import ride.sharing.model.vo.StatisticsVO;
import ride.sharing.model.vo.VisitCountVO;

public interface StatisticsServie {

	
	public List<StatisticsVO> listNewMemberRegistPerDay(StatisticsVO statisticsVO)  throws Exception;

	public List<VisitCountVO> listVisitorStatistics(VisitCountVO visitCountVO) throws Exception;
	
	
	
}
