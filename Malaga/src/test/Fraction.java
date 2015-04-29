package test;
public class Fraction{
	private int numerateur, denominateur;
	double limite;

	public Fraction(int nb1, int nb2) {
		// TODO Auto-generated constructor stub
		this.numerateur =nb1;
		this.denominateur = nb2;
	}

	public Fraction addition(Fraction f2){
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
		return new Fraction(numRes, denomRes);
	}

	public static void simplification(Fraction f){

		while(pgcd(f.getNumerateur(), f.getDenominateur()) > 1){
			for(int i=1; i<=9; i++){
				if(f.getNumerateur() % i == 0 && f.getDenominateur() % i == 0){
					f.setNumerateur(f.getNumerateur()/i);
					f.setDenominateur(f.getDenominateur()/i);
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

	public static String facteurPrems(int a){
		String texte ="";
		int i =2;
		while(a > 1){
			if(a % i ==0){
				texte = texte + i + " x ";
			
				a = a / i;
			}else{
				i++;
			}
		}
		if(texte.length() >3)
		texte = texte.substring(0,texte.length()-3);
		return texte;
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
		Fraction f1 = new Fraction(3, 4);
		Fraction f2 = new Fraction(5, 6);

		System.out.println(Fraction.ppcm(4, 12));
		System.out.println(Fraction.ppcm(10, 12));

		System.out.println();
		Fraction addition = f1.addition(f2);
		System.out.println(addition.getNumerateur() + "  " + addition.getDenominateur());
		Fraction.simplification(addition); 
		System.out.println(addition.getNumerateur() + "  " + addition.getDenominateur());
		System.out.println(Fraction.facteurPrems(2));
	}

}
