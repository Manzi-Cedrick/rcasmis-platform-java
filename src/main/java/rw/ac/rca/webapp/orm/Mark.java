package rw.ac.rca.webapp.orm;

import javax.persistence.*;

@Entity
public class Mark {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int Id;
    private int marks;
    private String owner;

    public Mark(String marks, String owner) {
        this.marks = Integer.parseInt(marks);
        this.owner = owner;
    }
}
