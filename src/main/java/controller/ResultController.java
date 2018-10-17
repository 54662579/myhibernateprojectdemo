/*
 * Result controller
 */
package controller;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.util.List;
import javax.naming.AuthenticationException;
import javax.xml.ws.http.HTTPException;
import model.Course;
import model.Result;
import model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.servlet.ModelAndView;
import service.CourseService;
import service.ResultService;
import service.StudentService;

/**
 *
 * @author Dev
 */
@Controller
public class ResultController {

    private ResultService resultService;
    private StudentService studentService;
    private CourseService courseService;

    @Autowired
    @Qualifier(value = "resultService")
    public void setResultService(ResultService resultService) {
        this.resultService = resultService;
    }

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

    @RequestMapping(value = "/result_form", method = {RequestMethod.GET, RequestMethod.POST})
    public String resultForm(Model model) {
        String form = null;
        List<Student> studentList = studentService.listStudents();
        List<Course> courseList = courseService.listCourses();
            if (!studentList.isEmpty() && !courseList.isEmpty()) {
                model.addAttribute("result", new Result());
                model.addAttribute("studentList", studentList);
                model.addAttribute("courseList", courseList);
                return form = "result_form";
            } else if (studentList.isEmpty() || courseList.isEmpty()) {
                if (studentList.isEmpty()) {
                    return form = "redirect:/student_form";
                } else {
                    return form = "redirect:/course_form";
                }
            }
        return form;
    }

    @RequestMapping(value = "/result_list", method = RequestMethod.GET)
    public String resultList(Model model) {
        model.addAttribute("resultList", resultService.listResults());
        return "result_list";
    }

    @RequestMapping(value = "/result/add", method = RequestMethod.POST)
    public String addResult(
            @RequestParam("student") int studentId,
            @RequestParam("course") int courseId,
            @RequestParam("sessionNumber") int sessionNumber,
            @RequestParam("mark") int mark
    ) {
        Student s = studentService.getStudentById(studentId, true);
        Course c = courseService.getCourseById(courseId, true);
        Result r = new Result();
        r.setStudent(s);
        r.setCourse(c);
        r.setSessionNumber(sessionNumber);
        r.setMark(mark);
        resultService.addResult(r);
        return "redirect:/result_list";
    }

    @RequestMapping(value = "/result/remove/{id}", method = RequestMethod.GET)
    public String removeResult(@PathVariable("id") int id) {
        Result r = resultService.getResultById(id);
        int studentId = r.getStudent().getId();
        int courseId = r.getCourse().getId();
        resultService.removeResult(r);
        return "redirect:/result_list";
    }

    @RequestMapping(value = "/result/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editResult(@PathVariable("id") int id) {
        List<Student> listStudents = studentService.listStudents();
        List<Course> listCourses = courseService.listCourses();
        ModelAndView model = new ModelAndView("result_edit");
        model.addObject("result", resultService.getResultById(id));
        model.addObject("studentList", listStudents);
        model.addObject("courseList", listCourses);
        return model;
    }

    @RequestMapping(value = "/result/edit/update", method = RequestMethod.POST)
    public String updateResult(
            @RequestParam("id") int resultId,
            @RequestParam("student") int studentId,
            @RequestParam("course") int courseId,
            @RequestParam("sessionNumber") int sessionNumber,
            @RequestParam("mark") int mark) {
        Student s = studentService.getStudentById(studentId, true);
        Course c = courseService.getCourseById(courseId, true);
        Result r = resultService.getResultById(resultId);
        r.setStudent(s);
        r.setCourse(c);
        r.setSessionNumber(sessionNumber);
        r.setMark(mark);
        resultService.updateResult(r);
        return "redirect:/result_list";
    }

}
