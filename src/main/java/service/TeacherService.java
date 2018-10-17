/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.List;
import model.Teacher;

/**
 *
 * @author Dev
 */
public interface TeacherService {
    public void addTeacher(Teacher t);

    public void updateTeacher(Teacher t);

    public List<Teacher> listTeachers();

    public Teacher getTeacherById(int id, boolean loadCollections);

    public void removeTeacher(int id);
}
