/*
 * Student Data Access Object, methods defined are related to Student entity.
 */
package dao;

import java.util.List;
import model.Course;
import model.Result;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import model.Student;
import org.hibernate.Hibernate;

@Repository
public class StudentDAOImpl implements StudentDAO {

    private SessionFactory sessionFactory;
    private CourseDAO courseDAO;
    private ResultDAO resultDAO;

    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }

    public void setCourseDAO(CourseDAO courseDAO) {
        this.courseDAO = courseDAO;
    }

    public void setResultDAO(ResultDAO resultDAO) {
        this.resultDAO = resultDAO;
    }

    

       
    public void addStudent(Student s) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(s);
        session.flush();
    }

    public void updateStudent(Student s) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(s);
        session.flush();
    }

    @SuppressWarnings("unchecked")

    public List<Student> listStudents() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Student> studentsList = session.createQuery("from Student").list();
        return studentsList;
    }

    @Override
    public Student getStudentById(int id, boolean loadCollections) {
        Session session = sessionFactory.getCurrentSession();
        Student s = (Student) session.get(Student.class, new Integer(id));
        if (loadCollections) {
            Hibernate.initialize(s.getCourses());
            Hibernate.initialize(s.getResults());
        }
        return s;
    }

    @Override
    public void removeStudent(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Student s = (Student) session.load(Student.class, new Integer(id));
        if (null != s) {
            for (Course course : s.getCourses()) {
                courseDAO.removeStudentFromCourse(course, s);
            }
            s.getCourses().clear();
            for (Result result : s.getResults()) {
                resultDAO.removeResult(result);
            }
            s.getResults().clear();
            session.delete(s);
        }
    }
}
