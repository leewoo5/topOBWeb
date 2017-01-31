package org.zerock.service;

import java.util.List;

import org.zerock.domain.Main;
import org.zerock.domain.OBFinance_inout;
import org.zerock.domain.OBfinanceSC;
import org.zerock.domain.SearchCriteria;
import org.zerock.dto.OBFinanceDTO_inout;
import org.zerock.dto.OBFinanceResultDTO;

public interface OBFinanceService {
	public List<OBFinance_inout> listSearchCriteria(OBfinanceSC cri)throws Exception;
	public int listSearchCount(OBfinanceSC cri)throws Exception;
	public OBFinanceResultDTO result(OBfinanceSC cri)throws Exception;
	public void register_incomeExpense(OBFinance_inout inout)throws Exception;
	public OBFinance_inout read_incomeExpense(String bno)throws Exception;
	public void update_incomeExpense(String bno, OBFinance_inout inout)throws Exception;
	public void delete_incomeExpense(String bno)throws Exception;

}
