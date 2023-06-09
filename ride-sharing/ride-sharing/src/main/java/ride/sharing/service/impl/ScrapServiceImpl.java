package ride.sharing.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ride.sharing.model.dao.mapper.ScrapMapper;
import ride.sharing.model.vo.ScrapVO;
import ride.sharing.service.ScrapService;
import ride.sharing.util.config.PageMakerAndSearch;

@Service
public class ScrapServiceImpl implements ScrapService {

	
	@Autowired
	private ScrapMapper scrapMapper;
	
	
	@Override
	public int insertScrap(ScrapVO scrapVO) throws Exception {		
		return scrapMapper.insertScrap(scrapVO);
	}

	
	@Override
	public int scrapTotalCount(PageMakerAndSearch pageMaker) throws Exception {
		return scrapMapper.scrapTotalCount(pageMaker);
	}
	
	@Override
	public List<ScrapVO> listScrap(PageMakerAndSearch pageMaker) throws Exception {
		return scrapMapper.listScrap(pageMaker);
	}
	

	@Override
	public int deleteScrap(ScrapVO scrapVO) throws Exception {		
		return scrapMapper.deleteScrap(scrapVO);
	}


	@Override
	public int deleteScrap(Map<String, Object> map) throws Exception {
		return scrapMapper.deleteScrap(map);		
	}


	
}
