package Controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class AdviseController {

    @ExceptionHandler({Exception.class})
    public String error(Exception e) {
        System.out.println("error message: " + e.getMessage());
        return "redirect:/error";
    }

}
