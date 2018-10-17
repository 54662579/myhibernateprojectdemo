/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.TeacherDAO;
import java.util.List;
import model.Teacher;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Dev
 */
public class TeacherServiceImpl implements TeacherService {
    
    private TeacherDAO teacherDAO;

    public void setTeacherDAO(TeacherDAO teacherDAO) {
        this.teacherDAO = teacherDAO;
    }
   
    @Transactional
    public void addTeacher(Teacher t) {
        teacherDAO.addTeacher(t);
    }
    @Transactional
    public void updateTeacher(Teacher t) {
        teacherDAO.updateTeacher(t);
    }
    @Transactional
    public List<Teacher> listTeachers() {
        return teacherDAO.listTeachers();
    }
    @Transactional
    public Teacher getTeacherById(int id, boolean loadCollections) {
        return teacherDAO.getTeacherById(id, loadCollections);
    }
    @Transactional
    public void removeTeacher(int id) {
        teacherDAO.removeTeacher(id);
    }
    
}
