package pl.coderslab.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;

@Controller
public class HomeController {
	@Autowired
	UserRepository userRepository;
	@Autowired
	TweetRepository tweetRepository;

	@RequestMapping("/")
	public String index(Model model, HttpSession session) {
		String email = (String) session.getAttribute("email");
		if (email != null) {
			User user = userRepository.findFirstByEmail(email);
			Tweet tweet = new Tweet();
			model.addAttribute("user", user);
			model.addAttribute("tweet", tweet);
		}
		return "index";
	}
}
