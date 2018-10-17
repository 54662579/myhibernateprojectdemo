/*
 * Result Data Access Object, methods defined are related to Result entity.
 */
package dao;

import java.util.List;
import model.Result;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Dev
 */
@Repository
public class ResultDAOImpl implements ResultDAO {
    
    private SessionFactory sessionFactory;
    
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
    
    public void addResult(Result r) {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(r);

    }

    public void updateResult(Result r) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(r);
    }

    public List<Result> listResults() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Result> resultList = session.createQuery("from Result").list();
        return resultList;
    }

    public Result getResultById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Result r = (Result)session.get(Result.class, new Integer(id));
        return r;
    }

    public void removeResult(Result r) {
        Session session = this.sessionFactory.getCurrentSession();
        session.delete(r);
    }
    
}
