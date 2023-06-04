package ride.sharing.model.dao.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ride.sharing.model.vo.ScrapVO;
import ride.sharing.util.config.PageMakerAndSearch;

@Repository
public interface ScrapMapper {

	public int insertScrap(ScrapVO scrapVO) throws Exception;
	
	public int scrapTotalCount(PageMakerAndSearch pageMaker) throws Exception;
	
	public List<ScrapVO>  listScrap(PageMakerAndSearch pageMaker) throws Exception;
	
	public int deleteScrap(ScrapVO scrapVO) throws Exception;

	public int deleteScrap(Map<String, Object> map) throws Exception;


	
}
