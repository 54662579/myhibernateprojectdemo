/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Dev
 */
@Entity
@Table(name = "COURSES")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "COURSE_ID")
    private int id;
    private String courseName;
    private String courseDes;
    @Column(unique = true)
    private String courseCode;
    private int creditNumber; 
    /*one student can enroll in many courses, a course can have many student.
    Many to Many relationship and is owned by a student. */
    @ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name="COURSES_STUDENTS",
    	joinColumns={@JoinColumn(name="COURSE_ID")},
    	inverseJoinColumns={@JoinColumn(name="id")})
    private Set<Student> students = new HashSet();
    
    /*one teacher can teach many courses, a course can be taught by more than one
    teacher. Many to Many relationship and is owned by a teacher. */
    @ManyToMany(cascade = {CascadeType.ALL})
    @JoinTable(name="COURSES_TEACHERS",
    	joinColumns={@JoinColumn(name="COURSE_ID")},
    	inverseJoinColumns={@JoinColumn(name="id")})
    private Set<Teacher> teachers = new HashSet();
    
    @OneToMany(mappedBy = "course")
    private Set<Result> results;
    
    @Override
    public boolean equals(Object c){
        return this.getClass().equals(c.getClass()) && id == ((Course)c).getId();
    }

    @Override
    public int hashCode() {
        return id;
    }
    
    public Course() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseDes() {
        return courseDes;
    }

    public void setCourseDes(String courseDes) {
        this.courseDes = courseDes;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public int getCreditNumber() {
        return creditNumber;
    }

    public void setCreditNumber(int creditNumber) {
        this.creditNumber = creditNumber;
    }

    public Set<Result> getResults() {
        return results;
    }

    public void setResults(Set<Result> results) {
        this.results = results;
    }

    public Set<Student> getStudents() {
        return students;
    }

    public void setStudents(Set<Student> students) {
        this.students = students;
    }

    public Set<Teacher> getTeachers() {
        return teachers;
    }

    public void setTeachers(Set<Teacher> teachers) {
        this.teachers = teachers;
    }

}
