package co.uk.endava.controller;

import co.uk.endava.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by fvasile on 7/19/2016.
 */
@Controller
public class LoginController {
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView showAddUser(){
        return new ModelAndView("login", "userForm", new User());
    }
    @RequestMapping(value = "/User", method = RequestMethod.POST)
    public String showUser(@ModelAttribute("userForm")User user, ModelMap model) {

        model.addAttribute("username", user.getUsername());
        model.addAttribute("password", user.getPassword());

        return "Result";
    }
}
