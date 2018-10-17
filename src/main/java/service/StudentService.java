/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.List;
import model.Course;
import model.Student;

/**
 *
 * @author Dev
 */
public interface StudentService {
    public void addStudent(Student s);
    public void updateStudent(Student s);
    public List<Student> listStudents();
    public Student getStudentById(int id, boolean loadCollections);
    public void removeStudent(int id); 
    
}
