package pl.coderslab.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserRepository userRepository;

	@GetMapping("/register")
	public String showRegister(Model model) {
		model.addAttribute("user", new User());
		return "user/register";
	}

	@PostMapping("/register")
	public String showRegister(@Valid User user, BindingResult result) {
		if (result.hasErrors()) {
			return "user/register";
		}
		User existingUser = userRepository.findFirstByEmail(user.getEmail());
		if (existingUser != null) {
			FieldError error = new FieldError("user", "email", "Email musi być unikalny");
			result.addError(error);
			return "user/register";
		}
		userRepository.save(user);
		return "redirect:/";
	}

	@GetMapping("/login")
	public String showLogin(Model model) {
		model.addAttribute("user", new User());
		return "user/login";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute("user") User user, Model model, HttpSession session) {
		User existingUser = userRepository.findFirstByEmail(user.getEmail());
		if (existingUser != null && existingUser.getEmail().equals(user.getEmail())
				&& existingUser.getPassword().equals(user.getPassword())) {
			session.setAttribute("email", existingUser.getEmail());
		} else {
			model.addAttribute("loginError", "Nieprawidłowy login lub hasło");
		}
		return "redirect:/";
	}

	@RequestMapping(path = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("email");
		return "redirect:/";
	}
}
