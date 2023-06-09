package ride.sharing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ride.sharing.model.dao.mapper.StatisticsMapper;
import ride.sharing.model.vo.StatisticsVO;
import ride.sharing.model.vo.VisitCountVO;
import ride.sharing.service.StatisticsServie;

@Service
public class StatisticsServieImpl implements StatisticsServie{

	@Autowired
	private StatisticsMapper statisticsMapper;

	
	@Override
	public List<StatisticsVO> listNewMemberRegistPerDay(StatisticsVO statisticsVO) throws Exception {
		if(statisticsVO ==null || statisticsVO.getCurrentMonth()==null) return null;
			
		statisticsVO.getCurrentMonth();
		String lastDay=statisticsVO.getLastDay(statisticsVO.getCurrentMonth());
		statisticsVO.setStartDate(statisticsVO.getCurrentMonth()+"-01 00:00:00");
		statisticsVO.setEndDate(lastDay);
		
		return statisticsMapper.listNewMemberRegistPerDay(statisticsVO);
	}


	@Override
	public List<VisitCountVO> listVisitorStatistics(VisitCountVO visitCountVO) throws Exception {
		if(visitCountVO ==null || visitCountVO.getCurrentMonth()==null) return null;
		
		visitCountVO.getCurrentMonth();
		String lastDay=visitCountVO.getLastDay(visitCountVO.getCurrentMonth());
		visitCountVO.setStartDate(visitCountVO.getCurrentMonth()+"-01 00:00:00");
		visitCountVO.setEndDate(lastDay);
		
		return statisticsMapper.listVisitorStatistics(visitCountVO);
	}

	
	
	
}
