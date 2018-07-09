package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/tweet")

public class TweetController {

    @Autowired
    TweetRepository tweetRepository;

    @RequestMapping("/{id}/tweets")
    public String getTweetsByUserId(@PathVariable Long id, Model model) {
        if (id != null) {
            List<Tweet> tweets = tweetRepository.findAllByUserId(id);
            model.addAttribute("tweets", tweets);

        } else {

        }
        return "tweet/list";
    }

//    @RequestMapping("/user-tweets")
//    public String getTweetsByUser(@RequestParam(required = false) User user, Model model) {
//
//        User user = new User();
//        user.getId(1L);
//        List<Tweet> tweets = tweetRepository.findByUser(user);
//        model.addAttribute("tweets", tweets);
//
//        return "tweet/list";
//    }

    @ModelAttribute("tweets")
    public List<Tweet> getTweets() {
        return tweetRepository.findAll();
    }


    @RequestMapping("/add")
    public String showForm(@RequestParam(required = false) Long id, Model model) {
        if (id == null) {
            Tweet tweet = new Tweet();
            model.addAttribute("tweet", tweet);
        } else {
            Tweet tweet = tweetRepository.findOne(id);
            model.addAttribute("tweet", tweet);
        }

        return "tweet/form";
    }


    @RequestMapping(path = "/add", method = RequestMethod.POST)
    public String saveForm(@ModelAttribute(name = "tweet") @Valid Tweet tweet, BindingResult tweetBindingResult) {


        System.out.println(tweet.toString());


        if (tweetBindingResult.hasErrors()) {
            return "tweet/list";
        }
        if (tweet.getId() == null) {
            tweetRepository.save(tweet);
        } else {
            tweetRepository.save(tweet);
        }
        return "redirect:add";
    }
}
