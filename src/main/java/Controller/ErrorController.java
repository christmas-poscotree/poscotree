package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ErrorController {

    @GetMapping("/error")
    public String errorPage() {
        return "error/error";
    }

    @GetMapping("/error404")
    public String errorPage404(){
        return "error/error404";
    }

}
