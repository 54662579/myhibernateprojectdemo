/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.CourseDAO;
import java.util.List;
import model.Course;
import model.Student;
import model.Teacher;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Dev
 */
public class CourseServiceImpl implements CourseService {
    
    private CourseDAO courseDao;
    
    public void setCourseDAO(CourseDAO courseDao){
        this.courseDao = courseDao;
    }

    @Transactional
    public void addCourse(Course c) {
        courseDao.addCourse(c);
    }
    @Transactional
    public void updateCourse(Course c) {
        courseDao.updateCourse(c);
    }
    @Transactional
    public List<Course> listCourses() {
        return courseDao.listCourses();
    }
    @Transactional
    public Course getCourseById(int cId, boolean loadCollections){
        return courseDao.getCourseById(cId, loadCollections);
    }
    @Transactional
    public void removeCourse(int id) {
        courseDao.removeCourse(id);
    }
    @Transactional
    public void addStudentToCourse(Course course, Student student){
        courseDao.addStudentToCourse(course, student);
    }
    @Transactional
    public void removeStudentFromCourse(Course course, Student student){
        courseDao.removeStudentFromCourse(course, student);
    }
    @Transactional
    public void addTeacherToCourse(Course course, Teacher teacher){
        courseDao.addTeacherToCourse(course, teacher);   
    }
    @Transactional
    public void removeTeacherFromCourse(Course course, Teacher teacher){
        courseDao.removeTeacherFromCourse(course, teacher);
    }
    
}
