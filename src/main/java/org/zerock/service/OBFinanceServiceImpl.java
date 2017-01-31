package org.zerock.service;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.OBFinance_inout;
import org.zerock.domain.OBfinanceSC;
import org.zerock.dto.OBFinanceDTO_inout;
import org.zerock.dto.OBFinanceResultDTO;
import org.zerock.persistence.OBFinanceDAO;
@Service
public class OBFinanceServiceImpl implements OBFinanceService {

  @Inject
  private OBFinanceDAO dao;

@Override
public List<OBFinance_inout> listSearchCriteria(OBfinanceSC cri)throws Exception {
	return dao.listSearch(cri);
}

@Override
public int listSearchCount(OBfinanceSC cri)throws Exception {
	return dao.listSearchCount(cri);
}

@Override
public OBFinanceResultDTO result(OBfinanceSC cri)throws Exception {
	return dao.searchResult(cri);
}

@Transactional
@Override
public void register_incomeExpense(OBFinance_inout inout)throws Exception {
	dao.register_incomeExpense(inout);
}

@Override
public OBFinance_inout read_incomeExpense(String bno)throws Exception {
	return dao.read_incomeExpense(bno);
}
@Transactional
@Override
public void update_incomeExpense(String bno, OBFinance_inout inout)throws Exception {
	dao.update_incomeExpense(bno, inout);
}

@Override
public void delete_incomeExpense(String bno)throws Exception {
	dao.delete_incomeExpense(bno);
}



}
  
 
