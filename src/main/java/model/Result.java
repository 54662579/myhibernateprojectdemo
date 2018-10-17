/*
 * Result entity
 */
package model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 *
 * @author Dev
 */
@Entity
@Table(name="RESULTS")
public class Result {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    
    //many students can have more than one result, relationship is owned by a student.
    @ManyToOne(optional = false)
    @JoinColumn(name="STUDENT_ID")
    private Student student;
    //One course can have more than one result, relationship is owned by a course.
    @ManyToOne(optional=false)
    @JoinColumn(name="COURSE_ID")
    private Course course;
    
    private int sessionNumber;
    private int mark;
    
    @Override
    public boolean equals(Object r){
        return this.getClass().equals(r.getClass()) && id == ((Result)r).getId();
    }

    @Override
    public int hashCode() {
        return id;
    }
    
    public Result() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getSessionNumber() {
        return sessionNumber;
    }

    public void setSessionNumber(int sessionNumber) {
        this.sessionNumber = sessionNumber;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }

    
    
}
