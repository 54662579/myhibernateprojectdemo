/*
 * Course controller
 */
package controller;

import static controller.StudentController.log;
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
import service.ResultService;
import service.StudentService;
import service.TeacherService;

/**
 *
 * @author Dev
 */
@Controller
public class CourseController {
    final static Logger log = Logger.getLogger(StudentController.class);

    private CourseService courseService;
    private StudentService studentService;
    private TeacherService teacherService;
    
    @Autowired(required = true)
    @Qualifier(value = "courseService")
    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }
    
    @Autowired(required = true)
    @Qualifier(value = "studentService")
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }
    
    @Autowired
    @Qualifier(value = "teacherService")
    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }
    
    @RequestMapping(value="/course_form", method= RequestMethod.GET)
    public String courseForm(Model model){
        model.addAttribute("course", new Course());
        return "course_form";
    }
    
    @RequestMapping(value="/course_list", method= RequestMethod.GET)
    public String courseList(Model model){
        model.addAttribute("courseList", courseService.listCourses());
        return "course_list";
    }
    
    @RequestMapping(value="/course/add", method=RequestMethod.POST)
    public String addCourse(@ModelAttribute("course") Course c, Model model) {
        try {
        courseService.addCourse(c);
        return "redirect:/index.jsp";
        } catch (Exception ex){
            log.info("Exception: " + ex.getMessage(), ex);
            String exception = "Information could not be added: " + ex.getMessage() + ".";
            model.addAttribute("msg", exception);
            return "course_form";
        }
    }
    
    @RequestMapping(value="/course/remove/{id}", method=RequestMethod.GET)
    public String removeCourse(@PathVariable("id") int id){
        courseService.removeCourse(id);
        return "redirect:/course_list";
    }
    
    @RequestMapping(value="/course/detail/{id}", method=RequestMethod.GET)
    public ModelAndView showCourse(@PathVariable("id") int id){
        ModelAndView model = new ModelAndView("course_detail");
        model.addObject("course", courseService.getCourseById(id, true));
        return model;
    }
    
    @RequestMapping(value="/course/edit/{id}", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView editCourse(@PathVariable("id") int id){
        ModelAndView model = new ModelAndView("course_edit");
        model.addObject("course", courseService.getCourseById(id, true));
        return model;
    }
    
    @RequestMapping(value="/course/edit/update", method=RequestMethod.POST)
    public String updateCourse(@ModelAttribute("course") Course c, Model model){
        try {
        Course oldCourse = courseService.getCourseById(c.getId(), true);
        c.setStudents(oldCourse.getStudents());
        c.setTeachers(oldCourse.getTeachers());
        c.setResults(oldCourse.getResults());
        courseService.updateCourse(c);
        return "redirect:/course_list";
        } catch (Exception ex){
            log.info("Exception: " + ex.getMessage(), ex);
            String exception = "Information could not be added: " + ex.getMessage() + ".";
            model.addAttribute("msg", exception);
            return "forward:/course/edit/" + c.getId();
        }
    }
    

}
