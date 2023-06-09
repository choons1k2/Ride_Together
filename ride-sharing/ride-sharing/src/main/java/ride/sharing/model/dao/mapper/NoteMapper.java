package ride.sharing.model.dao.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ride.sharing.model.vo.NoteVO;
import ride.sharing.util.config.PageMakerAndSearch;

@Repository
public interface NoteMapper {

	public int insertNote(NoteVO noteVO) throws Exception;
	
	public int noteReceiveTotalCount(PageMakerAndSearch pageMaker) throws Exception;
	
	public List<NoteVO> listNoteReceive(PageMakerAndSearch pageMaker) throws Exception;
	
	public int deleteNote(NoteVO noteVO) throws Exception;

	public int deleteNote(Map<String, Object> map) throws Exception;

	public void updateReadCnt(NoteVO noteVO) throws Exception;

	public NoteVO readNote(NoteVO noteVO) throws Exception;

	public List<NoteVO>  messageList(NoteVO noteVO) throws Exception;

	public int updateTotalReadCnt(NoteVO noteVO) throws Exception;

	public void deleteMyNote(NoteVO noteVO) throws Exception;

	public List<NoteVO> groupMessgeList(PageMakerAndSearch pageMaker) throws Exception;

	public int groupMessgeListTotalCount(PageMakerAndSearch pageMaker) throws Exception;

	public int deleteGroupNote(NoteVO noteVO) throws Exception;

	public int noticeCount(NoteVO noteVO) throws Exception;

	public List<NoteVO> notificationMessage(NoteVO noteVO) throws Exception;

	public int noteReceiveAdminTotalCount(PageMakerAndSearch pageMaker) throws Exception;

	public List<NoteVO> listNoteAdminReceive(PageMakerAndSearch pageMaker) throws Exception;

	public int deleteRealNote(NoteVO noteVO) throws Exception;

	public int adminGroupMessgeListTotalCount(PageMakerAndSearch pageMaker) throws Exception;

	public List<NoteVO> adminGroupMessgeList(PageMakerAndSearch pageMaker)  throws Exception;


	
}
