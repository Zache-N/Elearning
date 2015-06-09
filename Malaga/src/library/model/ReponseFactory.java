package library.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Random;


public class ReponseFactory implements ReponseFacade {

    private Collection<Reponse> reponses = null;
    
    public ReponseFactory () {
        init();
    }

    private void init() {
        reponses = new ArrayList<Reponse>();
       Random random = new Random();
       reponses.add(new Reponse(random.nextLong(), "0", "0","0"));
    }

    public Collection<Reponse> getBooks() {
        return reponses;
    }

    public void setBooks(Collection<Reponse> reponse) {
        this.reponses = reponse;
    }
    
    public long createBook(Reponse reponse) {
        Random random = new Random();
        reponse.setId(random.nextLong());
        reponses.add(reponse);

        return reponse.getId();
    }
    
    public void updateBook(Reponse reponse) {
        ArrayList<Reponse> booksNew = (ArrayList<Reponse>) reponses;
        int index = 0;
        for (Iterator<Reponse> iter = reponses.iterator(); iter.hasNext();) {
            Reponse element = (Reponse) iter.next();
            if (element.getId() == reponse.getId()) {
            	booksNew.set(index, reponse);
                break;
            }
            index++;
        }
        
        reponses = booksNew;
    }
    

    public Reponse findBook(long id) {
        for (Iterator<Reponse> iter = reponses.iterator(); iter.hasNext();) {
            Reponse element = (Reponse) iter.next();
            if (element.getId() == id) return (Reponse) element;
        }
        return null;
    }
    
    public void deleteBook(long id){
        Collection<Reponse> booksNew = new ArrayList<Reponse>();
        for (Iterator<Reponse> iter = reponses.iterator(); iter.hasNext();) {
            Reponse element = (Reponse) iter.next();
            if (element.getId() != id){
            	booksNew.add(element);
            }
        }
        reponses = booksNew;
    }

}