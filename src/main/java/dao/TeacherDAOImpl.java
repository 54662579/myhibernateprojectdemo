/*
 * Teacher Data Access Object, methods defined are related to Teacher entity.
 */
package dao;

import java.util.List;
import model.Course;
import model.Teacher;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Dev
 */
@Repository
public class TeacherDAOImpl implements TeacherDAO {

    private SessionFactory sessionFactory;
    private CourseDAO courseDAO;

    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }

    public void setCourseDAO(CourseDAO courseDAO) {
        this.courseDAO = courseDAO;
    }


    public void addTeacher(Teacher t) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(t);
    }

    public void updateTeacher(Teacher t) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(t);
    }

    public List<Teacher> listTeachers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Teacher> teacherList = session.createQuery("from Teacher").list();
        return teacherList;
    }

    public Teacher getTeacherById(int id, boolean loadCollections){
        Session session = this.sessionFactory.getCurrentSession();
        Teacher t = (Teacher) session.get(Teacher.class, new Integer(id));
        if (loadCollections) {
            Hibernate.initialize(t.getCourses());
        }
        return t;
    }

    public void removeTeacher(int id) {
        Session session = sessionFactory.getCurrentSession();
        Teacher t = getTeacherById(id, true);
        if(null != t){
        	for (Course course : t.getCourses()) {
        		courseDAO.removeTeacherFromCourse(course, t);
        	}
        	t.getCourses().clear();
            session.delete(t);
        }
    }

}
