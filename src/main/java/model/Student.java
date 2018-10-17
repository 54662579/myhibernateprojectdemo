/*
 * Student Entity
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
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Dev
 */
@Entity
@Table(name = "STUDENTS")
public class Student {
    
    //automatic generated id by hibernate
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "STUDENT_ID")
    private int id;
    private String firstName;
    private String lastName;
    private String gender;
    private String organisation;
    private String address;
    private String city;
    private String province;
    private String country;
    private String zipcode;
    private String phoneNumber;
    @Column(unique = true)
    private String email;
    private String major;
    private String dateOfBirth;
    
    /*manytomany realationship with course, fetch type is set to lazy to 
    prevent session from loading the child class (course) - it will prevent
    from having two object with the same id in the session. Problem could happen
    when loading a course which eager-loads its students. */
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "students", cascade = CascadeType.ALL)
    private Set<Course> courses = new HashSet();
    
    //One student can have more than one result - thus one to many relationship
    @OneToMany(mappedBy = "student")
    private Set<Result> results;
    
    @Override
    public boolean equals(Object s){
        return this.getClass().equals(s.getClass()) && id == ((Student)s).getId();
    }

    @Override
    public int hashCode() {
        return id;
    }
    
    public Student() {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getOrganisation() {
        return organisation;
    }

    public void setOrganisation(String organisation) {
        this.organisation = organisation;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Set<Result> getResults() {
        return results;
    }

    public void setResults(Set<Result> results) {
        this.results = results;
    }

    public Set<Course> getCourses() {
        return courses;
    }

    public void setCourses(Set<Course> courses) {
        this.courses = courses;
    }

    
}
