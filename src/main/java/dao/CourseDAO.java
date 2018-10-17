/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Course;
import model.Student;
import model.Teacher;

/**
 *
 * @author Dev
 */
public interface CourseDAO {
    public void addCourse(Course c);

    public void updateCourse(Course c);

    public List<Course> listCourses();

    public Course getCourseById(int cId, boolean loadCollections);

    public void removeCourse(int id);
    
    public void addStudentToCourse(Course course, Student student);
    
    public void removeStudentFromCourse(Course course, Student student);
    
    public void addTeacherToCourse(Course course, Teacher teacher);
    
    public void removeTeacherFromCourse(Course course, Teacher teacher) ;
    
}
