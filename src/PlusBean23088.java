package simple;
import java.io.Serializable;

public class PlusBean23088 implements Serializable {
	private String expression = "";
	private String result = "";

	public void setExpression(int x, int y){
		this.expression = x + "+" + y;
	}
    public String getExpression(){
		return expression;
	}
    public String getResult(){
		return result;
	}
    public void calc(int x, int y){
		int sum_result = x + y;
		this.result = String.valueOf(sum_result);
	}
}