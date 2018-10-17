/*
 * Course Data Access Object, methods defined are related to Course entity.
 * 
 */
package dao;

import java.util.List;
import model.Course;
import model.Student;
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
public class CourseDAOImpl implements CourseDAO {

    private SessionFactory sessionFactory;
    private ResultDAO resultDAO;

    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }

    public void setResultDAO(ResultDAO resultDAO) {
        this.resultDAO = resultDAO;
    }

    public void addCourse(Course c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(c);
        session.flush();
    }

    public void updateCourse(Course c) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(c);
        session.flush();
    }

    public List<Course> listCourses() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Course> courseList = session.createQuery("from Course").list();
        return courseList;
    }

    public Course getCourseById(int cId, boolean loadCollections) {
        Session session = sessionFactory.getCurrentSession();
        Course c = (Course) session.get(Course.class, cId);

        if (loadCollections && c != null) {
            Hibernate.initialize(c.getStudents());
            Hibernate.initialize(c.getTeachers());
            Hibernate.initialize(c.getResults());
        }
        return c;
    }

    public void removeCourse(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Course c = (Course) session.load(Course.class, new Integer(id));
        if (c != null) {
            c.getStudents().clear();
            c.getTeachers().clear();
            c.getResults().clear();
            session.delete(c);
        }
    }

    public void addStudentToCourse(Course course, Student student) {
        course.getStudents().add(student);
        updateCourse(course);
    }

    public void removeStudentFromCourse(Course course, Student student) {
        course.getStudents().remove(student);
        updateCourse(course);
    }

    public void addTeacherToCourse(Course course, Teacher teacher) {
        course.getTeachers().add(teacher);
        updateCourse(course);
    }

    public void removeTeacherFromCourse(Course course, Teacher teacher) {
        
        course.getTeachers().remove(teacher);
        updateCourse(course);
    }

}
