package org.zerock.dto;

public class OBFinanceResultDTO {
  	
  private int inputCount;
  private int inputSum;
  private int outputCount;
  private int outputSum;
public int getInputCount() {
	return inputCount;
}
public void setInputCount(int inputCount) {
	this.inputCount = inputCount;
}
public int getInputSum() {
	return inputSum;
}
public void setInputSum(int inputSum) {
	this.inputSum = inputSum;
}
public int getOutputCount() {
	return outputCount;
}
public void setOutputCount(int outputCount) {
	this.outputCount = outputCount;
}
public int getOutputSum() {
	return outputSum;
}
public void setOutputSum(int outputSum) {
	this.outputSum = outputSum;
}
@Override
public String toString() {
	return "OBFinanceDTO [inputCount=" + inputCount + ", inputSum=" + inputSum + ", outputCount=" + outputCount
			+ ", outputSum=" + outputSum + "]";
}

}
  
