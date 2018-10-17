/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.StudentDAO;
import model.Course;
import model.Student;
 


@Service
public class StudentServiceImpl implements StudentService {
    
    private StudentDAO studentDAO;

    public void setStudentDAO(StudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }
    
  
    @Transactional
    public void addStudent(Student s) {
        studentDAO.addStudent(s);
    }

    @Override
    @Transactional
    public void updateStudent(Student s) {
        studentDAO.updateStudent(s);
    }

    @Override
    @Transactional
    public List<Student> listStudents() {
        return studentDAO.listStudents();
    }

    @Override
    @Transactional
    public Student getStudentById(int id, boolean loadCollections) {
        return studentDAO.getStudentById(id, loadCollections);
    }

    @Override
    @Transactional
    public void removeStudent(int id) {
        studentDAO.removeStudent(id);
    }

}