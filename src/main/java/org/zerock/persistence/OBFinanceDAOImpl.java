package org.zerock.persistence;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.OBFinance_inout;
import org.zerock.domain.OBfinanceSC;
import org.zerock.dto.OBFinanceDTO_inout;
import org.zerock.dto.OBFinanceResultDTO;

@Repository
public class OBFinanceDAOImpl implements OBFinanceDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.mapper.obfinanceMapper";

	@Override
	public List<OBFinance_inout> listSearch(OBfinanceSC cri)throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(OBfinanceSC cri)throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public OBFinanceResultDTO searchResult(OBfinanceSC cri) {
		int inputCount = session.selectOne(namespace + ".inputCount", cri);
		
		int inputSum;
		if (inputCount!=0) {
			inputSum = session.selectOne(namespace + ".inputSum", cri);
		}else{
			inputSum = 0;
		}
		
		int outputCount = session.selectOne(namespace + ".outputCount", cri);
		
		int outputSum;
		if (outputCount != 0) {
			outputSum = session.selectOne(namespace + ".outputSum", cri);
		}else{
			outputSum = 0;
		}
		
		OBFinanceResultDTO dto = new OBFinanceResultDTO();
		dto.setInputCount(inputCount);
		dto.setInputSum(inputSum);
		dto.setOutputCount(outputCount);
		dto.setOutputSum(outputSum);
		return dto;
	}

	@Override
	public void register_incomeExpense(OBFinance_inout inout)throws Exception {
		session.insert(namespace + ".insertNewIncomeExpense", inout);
	}

	@Override
	public OBFinance_inout read_incomeExpense(String bno)throws Exception {
		return session.selectOne(namespace + ".read_incomeExpense", bno);
	}

	@Override
	public void update_incomeExpense(String bno, OBFinance_inout inout)throws Exception {
		inout.setBno(Integer.parseInt(bno));
		session.update(namespace + ".updateIncomeExpense", inout);
	}

	@Override
	public void delete_incomeExpense(String bno)throws Exception{
		int num = Integer.parseInt(bno);
		session.delete(namespace + ".deleteIncomeExpense", num);
	}
	
	
}
