package ride.sharing.model.dao.mapper;

import org.springframework.stereotype.Repository;

import ride.sharing.model.vo.VisitCountVO;

@Repository
public interface VisitCounterMapper {

    public int insertVisitor(VisitCountVO vo) throws Exception ;
      
    
}
