package test;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Resultat {
	private int num1, num2, denom1, denom2;
	private int id;
	
	public Resultat() {
		// TODO Auto-generated constructor stub
	}
	public Resultat(int id,int num1, int num2,int denom1,int denom2){
		this.id=id;
		this.num1 = num1;
		this.num2 = num2;
		this.denom1 = denom1;
		this.denom2 = denom2;
	}
	
	

	public int getNum1() {
		return num1;
	}

	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	public int getDenom1() {
		return denom1;
	}

	public void setDenom1(int denom1) {
		this.denom1 = denom1;
	}

	public int getDenom2() {
		return denom2;
	}

	public void setDenom2(int denom2) {
		this.denom2 = denom2;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

}
