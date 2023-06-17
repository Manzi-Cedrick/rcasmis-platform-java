package rw.ac.rca.webapp.dao.impl;

import org.hibernate.Query;
import rw.ac.rca.webapp.dao.ParentDAO;
import rw.ac.rca.webapp.orm.Parent;

import java.util.List;

public class ParentDAOImpl extends DAO implements ParentDAO {
    private static ParentDAOImpl instance;
    public static ParentDAOImpl getInstance(){
        if (instance == null){
            return new ParentDAOImpl();
        }
        return instance;
    }
    @Override
    public List<Parent> getAllParents() {
        try {
            begin();
            Query query = getSession().createQuery("from Parent");
            List<Parent> parents = query.list();
            System.out.println("============== Parents =====================" + parents);
            commit();
            return parents;
        } catch (Exception e){
            System.out.println("Error,failed to get parent list:"+e.getMessage());
            rollback();
            return null;
        }
    }

    @Override
    public Parent registerParent(Parent parent) {
        try {
            begin();
            getSession().saveOrUpdate(parent);
            commit();
            return parent;
        } catch (Exception e){
            System.out.println("Error, failed to save a parent: "+e.getMessage());
            rollback();
            return null;
        }
    }
}
