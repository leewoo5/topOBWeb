package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.OBFinance_inout;
import org.zerock.domain.OBfinanceSC;
import org.zerock.domain.SearchCriteria;
import org.zerock.dto.OBFinanceDTO_inout;
import org.zerock.dto.OBFinanceResultDTO;

public interface OBFinanceDAO {
	public List<OBFinance_inout> listSearch(OBfinanceSC cri) throws Exception;
	public int listSearchCount(OBfinanceSC cri) throws Exception;
	public OBFinanceResultDTO searchResult(OBfinanceSC cri);
	public void register_incomeExpense(OBFinance_inout inout) throws Exception;
	public OBFinance_inout read_incomeExpense(String bno) throws Exception;
	public void update_incomeExpense(String bno, OBFinance_inout inout) throws Exception;
	public void delete_incomeExpense(String bno) throws Exception;
}
