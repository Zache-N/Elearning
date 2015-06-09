/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library.model;


public interface ReponseFacade {
    public long createBook(Reponse reponse);
    public void updateBook(Reponse reponse);
    public Reponse findBook(long id);
    public void deleteBook(long id);    
}
