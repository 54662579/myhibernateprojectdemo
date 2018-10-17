/*
 * Teacher Controller
 */
package controller;

import java.util.List;
import model.Course;
import model.Student;
import model.Teacher;
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
import service.TeacherService;

/**
 *
 * @author Dev
 */
@Controller
public class TeacherController {
    
    private TeacherService teacherService;
    private CourseService courseService;

    @Autowired
    @Qualifier(value = "teacherService")
    public void setTeacherService(TeacherService teacherService) {
        this.teacherService = teacherService;
    }
    
    @Autowired(required = true)
    @Qualifier(value = "courseService")
    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }
    
    @RequestMapping(value="/teacher_form", method= RequestMethod.GET)
    public String teacherForm(Model model){
        model.addAttribute("teacher", new Teacher());
        return "teacher_form";
    }
    
    @RequestMapping(value="/teacher_list", method= RequestMethod.GET)
    public String teacherList(Model model){
        model.addAttribute("teacherList", teacherService.listTeachers());
        return "teacher_list";
    }
    
    @RequestMapping(value="/teacher/add", method=RequestMethod.POST)
    public String addTeacher(@ModelAttribute("teacher") Teacher t) {
        teacherService.addTeacher(t);
        return "redirect:/index.jsp";
    }
    
    @RequestMapping(value="/teacher/remove/{id}", method=RequestMethod.GET)
    public String removeTeacher(@PathVariable("id") int id){
        teacherService.removeTeacher(id);
        return "redirect:/teacher_list";
    }
    
    @RequestMapping(value="/teacher/detail/{id}", method=RequestMethod.GET)
    public ModelAndView showTeacher(@PathVariable("id") int id){
        ModelAndView model = new ModelAndView("teacher_detail");
        model.addObject("teacher", teacherService.getTeacherById(id, true));
        return model;
    }
    
    @RequestMapping(value="/teacher/edit/{id}", method=RequestMethod.GET)
    public ModelAndView editTeacher(@PathVariable("id") int id){
        ModelAndView model = new ModelAndView("teacher_edit");
        model.addObject("teacher", teacherService.getTeacherById(id, true));
        return model;
    }
    
    @RequestMapping(value="/teacher/edit/update", method=RequestMethod.POST)
    public String updateTeacher(@ModelAttribute("teacher") Teacher t){
        teacherService.updateTeacher(t);
        return "redirect:/teacher_list";
    }
    
    @RequestMapping(value = "/teacher_course", method=RequestMethod.GET)
    public String addForm(Model model){
        String form = null;
        List<Teacher> teacherList = teacherService.listTeachers();
        List<Course> courseList = courseService.listCourses();
        if (!teacherList.isEmpty() && !courseList.isEmpty()) {
            model.addAttribute("teacherList", teacherList);
            model.addAttribute("courseList", courseList);
            return form = "teacher_course";
        } else if (teacherList.isEmpty() || courseList.isEmpty()) {
            if (teacherList.isEmpty()) {
                return form = "redirect:/teacher_form";
            } else {
                return form = "redirect:/course_form";
            }
        }
        return form;
    }
    
    @RequestMapping(value = "/teacher_course/add", method=RequestMethod.POST)
    public String addTeacherToCourse(
            @RequestParam("teacher") int teacherId,
            @RequestParam("course") int courseId){
        Teacher t = teacherService.getTeacherById(teacherId, false);
        Course c = courseService.getCourseById(courseId, true);
        courseService.addTeacherToCourse(c, t);
        return "redirect:/index.jsp";
    }
    
    @RequestMapping(value="/teacher_course/delete/{teacherId}/{courseId}", method = RequestMethod.GET)
    public String removeTeacherfromCourse(
            @PathVariable("teacherId")int teacherId,
            @PathVariable("courseId")int courseId){
        Teacher t = teacherService.getTeacherById(teacherId, false);
        Course c = courseService.getCourseById(courseId, true);
        courseService.removeTeacherFromCourse(c, t);
        return "redirect:/teacher_list";
    }
}
