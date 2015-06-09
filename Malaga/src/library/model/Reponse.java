
package library.model;

/**
 * @author laliluna
 */
public class Reponse {

    private long id = 0;
    private String rep1 = "";
    private String rep2 = "";
    private String mcm = "";


    // Contructor
    public Reponse(){}
    //  Contructor to initial the properties
    public Reponse(long id, String rep1, String rep2, String mcm) {
        this.id = id;
        this.mcm = mcm;
        this.rep1=rep1;
        this.rep2 = rep2;
    }

	public String getRep1() {
		return rep1;
	}
	public void setRep1(String rep1) {
		this.rep1 = rep1;
	}
	public String getRep2() {
		return rep2;
	}
	public void setRep2(String rep2) {
		this.rep2 = rep2;
	}
	public String getMcm() {
		return mcm;
	}
	public void setMcm(String mcm) {
		this.mcm = mcm;
	}
	public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

}