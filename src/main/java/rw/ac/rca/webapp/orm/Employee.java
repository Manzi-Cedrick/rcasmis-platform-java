package rw.ac.rca.webapp.orm;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "employee")
public class Employee extends Person{
    public Employee(String firstName, String lastName, Date dateOfBirth, String phoneNumber) {
        super(firstName, lastName, dateOfBirth, phoneNumber);
    }
    public Employee() {
    }
}
