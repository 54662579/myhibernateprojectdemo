/*
 * Student Controller
 */
package controller;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.List;
import model.Course;
import model.Student;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.CourseService;
import service.StudentService;

@Controller
public class StudentController {
    final static Logger log = Logger.getLogger(StudentController.class);
    
    private StudentService studentService;
    private CourseService courseService;

    @Autowired(required = true)
    @Qualifier(value = "studentService")
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    @Autowired(required = true)
    @Qualifier(value = "courseService")
    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    @RequestMapping(value = "/student_form", method = RequestMethod.GET)
    public String studentForm(Model model) {
        model.addAttribute("student", new Student());
        return "student_form";
    }

    @RequestMapping(value = "/student_list", method = RequestMethod.GET)
    public String listStudents(Model model) {
        model.addAttribute("listStudents", studentService.listStudents());
        return "student_list";
    }

    @RequestMapping(value = "/student/add", method = RequestMethod.POST)
    public String addStudent(@ModelAttribute("student") Student s, Model model) {
        try {
            studentService.addStudent(s);
            return "redirect:/index.jsp";
        } catch (Exception ex) {
            log.info("Exception: " + ex.getMessage(), ex);
            String exception = "Information could not be added: " + ex.getMessage() + ".";
            model.addAttribute("msg", exception);
            return "student_form";
        }
    }

    @RequestMapping("/student/remove/{id}")
    public String removeStudent(@PathVariable("id") int id) {
        studentService.removeStudent(id);
        return "redirect:/student_list";
    }

    @RequestMapping(value = "/student/detail/{id}", method = RequestMethod.GET)
    public ModelAndView showStudent(@PathVariable("id") int id) {
        ModelAndView model = new ModelAndView("student_detail");
        Student s = studentService.getStudentById(id, true);
        model.addObject("student", s);
        return model;
    }

    //include both get/post method because of the exception handler in the
    //update request.
    @RequestMapping(value = "/student/edit/{id}", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView editStudent(@PathVariable("id") int id) {
        ModelAndView model = new ModelAndView("student_edit");
        model.addObject("student", studentService.getStudentById(id, true));
        return model;
    }

    @RequestMapping(value = "/student/edit/update", method = RequestMethod.POST)
    public String updateStudent(@ModelAttribute("student") Student s, Model model) {
        try {
            studentService.updateStudent(s);
            return "redirect:/student_list";
        } catch (Exception ex) {
            log.info("Exception: " + ex.getMessage(), ex);
            String exception = "Information could not be added: " + ex.getMessage() + ".";
            model.addAttribute("msg", exception);
            return "forward:/student/edit/" + s.getId();
        }
    }

    @RequestMapping(value = "/student_course", method = RequestMethod.GET)
    public String addForm(Model model) {
        String form = null;
        List<Student> studentList = studentService.listStudents();
        List<Course> courseList = courseService.listCourses();
        if (!studentList.isEmpty() && !courseList.isEmpty()) {
            model.addAttribute("studentList", studentList);
            model.addAttribute("courseList", courseList);
            return form = "student_course";
        } else if (studentList.isEmpty() || courseList.isEmpty()) {
            if (studentList.isEmpty()) {
                return form = "redirect:/student_form";
            } else {
                return form = "redirect:/course_form";
            }
        }
        return form;
    }

    @RequestMapping(value = "/student_course/add", method = RequestMethod.POST)
    public String addStudentToCourse(
            @RequestParam("student") int studentId,
            @RequestParam("course") int courseId) {
            
            Student s = studentService.getStudentById(studentId, false);
            Course c = courseService.getCourseById(courseId, true);
            courseService.addStudentToCourse(c, s);
            return "redirect:/index.jsp";
      
    }

    @RequestMapping(value = "/student_course/delete/{studentId}/{courseId}", method = RequestMethod.GET)
    public String removeStudentfromCourse(
            @PathVariable("studentId") int studentId,
            @PathVariable("courseId") int courseId) {
        Student s = studentService.getStudentById(studentId, false);
        Course c = courseService.getCourseById(courseId, true);
        courseService.removeStudentFromCourse(c, s);
        return "redirect:/student_list";
    }
}
