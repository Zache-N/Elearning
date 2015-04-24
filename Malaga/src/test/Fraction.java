package test;

import java.util.ArrayList;

public class Fraction{
	int numerateur;
	int denominateur;



	public Fraction(int nb1, int nb2) {
		// TODO Auto-generated constructor stub
		this.numerateur =nb1;
		this.denominateur = nb2;
	}

	public int[] addition(Fraction f2){
		int numRes, denomRes;
		if(this.getDenominateur() == 0 || f2.getDenominateur() == 0){
			return null;
		}
		if(this.getDenominateur() == f2.getDenominateur()){
			numRes = this.getNumerateur() + f2.getNumerateur();
			denomRes = this.getDenominateur();
		}else{
			numRes = (this.getNumerateur()*f2.getDenominateur()) + (f2.getNumerateur()*this.getDenominateur());
			denomRes = this.getDenominateur()*f2.getDenominateur();
		}
		return new int[]{numRes,denomRes};
	}

	public static void simplification(int[] tab){
		
		while(pgcd(tab[0], tab[1]) != 1){
			for(int i=1; i<=9; i++){
				if(tab[0] % i == 0 && tab[1] % i == 0){
					tab[0] = tab[0]/i;
					tab[1] = tab[1]/i;
				}
			}
		}
	}

	public static int pgcd(int a, int b){
		int r =a;
		while (r!=0) {r=a%b; a=b; b=r;}
		return(Math.abs(a));
	}

	public static int ppcm(int a, int b){
		return  (a*b)/pgcd(a, b);
	}

	public static int[] facteurPrems(int a){
		ArrayList<Integer> l = new ArrayList<Integer>();
		int i =2;
		while(a != 1){
			if(a % i ==0){
				l.add(i);
				a = a / i;
			}else{
				i++;
			}
		}
		int[] tab = new int[l.size()];
		for (int j = 0; j < tab.length; j++) {
			tab[j] = l.get(j);
		}
		return tab;
	}

	public int getNumerateur() {
		return numerateur;
	}

	public void setNumerateur(int numerateur) {
		this.numerateur = numerateur;
	}
	public int getDenominateur() {
		return denominateur;
	}

	public void setDenominateur(int denominateur) {
		this.denominateur = denominateur;
	}

	public static void main(String[] args) {
		Fraction f1 = new Fraction(9, 4);
		Fraction f2 = new Fraction(8, 9);

		System.out.println(Fraction.ppcm(4, 12));
		System.out.println(Fraction.ppcm(10, 12));
		int[] t = facteurPrems(5);
		for (int i = 0; i < t.length; i++) {
			System.out.print(t[i] + "  |");
		}
		int[] tab = f1.addition(f2);
		System.out.println(tab[0] + "  " + tab[1]);
		f1.simplification(tab); 
		System.out.println(tab[0] + "  " + tab[1]);
	}

}
