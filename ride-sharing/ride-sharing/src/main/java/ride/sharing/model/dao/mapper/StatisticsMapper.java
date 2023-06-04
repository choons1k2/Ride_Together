package ride.sharing.model.dao.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;
import ride.sharing.model.vo.StatisticsVO;
import ride.sharing.model.vo.VisitCountVO;

@Repository
public interface StatisticsMapper {
	
	public List<StatisticsVO> listNewMemberRegistPerDay(StatisticsVO statisticsVO)  throws Exception;

	public List<VisitCountVO> listVisitorStatistics(VisitCountVO visitCountVO)  throws Exception;
	

	
}
