package com.liam.diceman.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.liam.diceman.models.Car;
import com.liam.diceman.models.LoginUser;
import com.liam.diceman.models.Title;
import com.liam.diceman.models.User;
import com.liam.diceman.services.CarService;
import com.liam.diceman.services.TitleService;
import com.liam.diceman.services.UserService;

@Controller
public class MainController {
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private CarService mainServ;
	
	@Autowired
	private TitleService soloServ;

	


//	  _________              _____ 
//	 /   _____/ ____________/ ____\
//	 \_____  \_/ __ \_  __ \   __\ 
//	 /        \  ___/|  | \/|  |   
//	/_______  /\___  >__|   |__|   
//	        \/     \/              


	
	// DashBoard
	@GetMapping("/dashboard") // All Serfs
	public String index(HttpSession session, Model viewModel) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		}

		Long userId = (Long) session.getAttribute("user_id");
		User userLog = userServ.getUser(userId);
		viewModel.addAttribute("userLog", userLog);
		
		viewModel.addAttribute("allSerfs", this.mainServ.getAll());
		
		return "views/dashboard.jsp";
	}
	
	
	// Show One Serf
	@GetMapping("/serf/show/{id}") // Show car
	public String showOne(@PathVariable("id") Long id, @ModelAttribute("car") Car car, Model viewModel, HttpSession session, @ModelAttribute("title") Title title) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		Long userId = (Long) session.getAttribute("user_id");

		viewModel.addAttribute("car", this.mainServ.getOne(id));
		viewModel.addAttribute("userLog", this.userServ.getUser(userId));
		viewModel.addAttribute("car", mainServ.getOne(id));
		return "views/showSerf.jsp";
	}
	


	// Create Serf Form
	@GetMapping("/newSerfForm") // New car form
	public String add(@ModelAttribute("carForm") Car car, HttpSession session) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		return "views/createSerf.jsp";
	}

	// Create Serf Process
	@PostMapping("/create/serf") // New car process
	public String createOne(@Valid @ModelAttribute("carForm") Car newSerf, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			 return "views/createSerf.jsp";
		}
		
		Long userId = (Long) session.getAttribute("user_id");
		newSerf.setOwner(this.userServ.getUser(userId));
		
		this.mainServ.createOne(newSerf);
		return "redirect:/dashboard";
	}
	
	
	// Edit Serf Form
	@GetMapping("/edit/serf/{id}") // Edit car form
	public String editCar(@PathVariable("id") Long id, @ModelAttribute("car") Car serf, Model viewModel, HttpSession session) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		
		Long userId = (Long) session.getAttribute("user_id");
		User userLog = userServ.getUser(userId);
		viewModel.addAttribute("userLog", userLog);
		
		viewModel.addAttribute("car", this.mainServ.getOne(id));
		return "views/editSerf.jsp";
		
	}
	
	// Edit Serf Process
	@PostMapping("/edit/serf/proc/{id}") // From edit process
	public String updateCar(@PathVariable("id") Long id, @Valid @ModelAttribute("car") Car serf, BindingResult result, @RequestParam("owner") User user, Model viewModel, HttpSession session) {
		if (result.hasErrors()) {

			Long userId = (Long) session.getAttribute("user_id");
			User userLog = userServ.getUser(userId);
			viewModel.addAttribute("userLog", userLog);
			viewModel.addAttribute("car", this.mainServ.getOne(id));
			return "views/editSerf.jsp";
		}
		serf.setOwner(user);
		this.mainServ.updateOne(serf);
		return "redirect:/serf/show/{id}";
	}
	

	// Delete Serf
	@GetMapping("/delete/serf/{id}") // Delete car (from index page)
	public String deleteSerf(@PathVariable("id") Long id) {
		this.mainServ.deleteOne(id);
		return "redirect:/dashboard";
	}
	
//	@PostMapping("/edit/{id}") // edit FROM show car PAGE
//	public String updateOne(@PathVariable("id") Long id, @Valid @ModelAttribute("car") Car updatedCar, BindingResult result, @ModelAttribute("tag") Tag tag, Model viewModel){
//		if (result.hasErrors()) {
//			viewModel.addAttribute("car", this.mainServ.getOne(id));
//			return "show.jsp";
//		}
//		this.mainServ.updateOne(updatedCar);
//		return "redirect:/" + id;
//	}
	


//	 _______                         ______      _______                    
//	|   |   |.---.-.-----.--.--.    |__    |    |   |   |.---.-.-----.--.--.
//	|       ||  _  |     |  |  |    |    __|    |       ||  _  |     |  |  |
//	|__|_|__||___._|__|__|___  |    |______|    |__|_|__||___._|__|__|___  |
//	                     |_____|                                     |_____|


	
	// User M2M Serf Process
	@GetMapping("/rsvp/{id}")
	public String RSVP(@PathVariable("id") Long id, HttpSession session) {
		Long userId = (Long) session.getAttribute("user_id");
		User rspvr = this.userServ.getUser(userId);
//		Long petId = id;
		Car rspvdCar = mainServ.getOne(id);
//		this.mainServ.addRSVP(rspvr, rspvdCar);
		return "redirect:/dashboard";
	}
	
	
	// User M2M Serf Process undo
	@GetMapping("/unrsvp/{id}")
	public String unRSVP(@PathVariable("id") Long id, HttpSession session) {
		Long userId = (Long) session.getAttribute("user_id");
		User rspvr = this.userServ.getUser(userId);
//		Long petId = id;
		Car rspvdCar = mainServ.getOne(id);
//		this.mainServ.removeRSVP(rspvr, rspvdCar);
		return "redirect:/dashboard";
	}
	


//	   ____                __           ____           
//	  / __ \____  ___     / /_____     / __ \____  ___ 
//	 / / / / __ \/ _ \   / __/ __ \   / / / / __ \/ _ \
//	/ /_/ / / / /  __/  / /_/ /_/ /  / /_/ / / / /  __/
//	\____/_/ /_/\___/   \__/\____/   \____/_/ /_/\___/ 
//	                                                   

	
	@RequestMapping("/addOneToOne/{id}") // Add one to Main Processing
	public String addOneToOne(@PathVariable("id") Long id, @Valid @ModelAttribute("title") Title title, BindingResult result, Model viewModel, HttpSession session) {
		if (result.hasErrors()) {
			Long userId = (Long) session.getAttribute("user_id");

			viewModel.addAttribute("car", this.mainServ.getOne(id));
			viewModel.addAttribute("userLog", this.userServ.getUser(userId));
			viewModel.addAttribute("car", mainServ.getOne(id));
			return "views/showSerf.jsp";
		}
		soloServ.createOne(title);
		return "redirect:/serf/show/{id}";
		
	}
	

//	 ____ ___                    
//	|    |   \______ ___________ 
//	|    |   /  ___// __ \_  __ \
//	|    |  /\___ \\  ___/|  | \/
//	|______//____  >\___  >__|   
//	             \/     \/       

	
	
	//////  NEW LOGIN/REG //////
	
    @GetMapping("/")
    public String loginPage(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "views/login.jsp";
    }
    
    // Create User Process
    @PostMapping("/registerUser")
    public String registerUser(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
    	userServ.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "views/login.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/dashboard";
    }
    
    // Login User Process
    @PostMapping("/loginUser")
    public String loginUser(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
        User user = userServ.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "views/login.jsp";
        }
        session.setAttribute("user_id", user.getId());
        return "redirect:/dashboard";
    }
    
    // Show One User
    @GetMapping("/user/show/{id}")
    public String showUser(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
    	
    	model.addAttribute("user", this.userServ.getUser(id));
        return "views/showUser.jsp";
    }
    
    // Logout User
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	session.invalidate();
	return "redirect:/";
	}
	
//  _________.__    .___      
// /   _____/|__| __| _/____  
// \_____  \ |  |/ __ |/ __ \ 
// /        \|  / /_/ \  ___/ 
///_______  /|__\____ |\___  >
//        \/         \/    \/ 
  

  // ONE:MANY ///////////////////
  
//  // Side form
//  @RequestMapping("/answers/new")
//  public String newSideForm(@ModelAttribute("answer") Answer obj, Model model) {
//      List<Question> everything = mainServ.getAll();
//      model.addAttribute("questions", everything);
//      return "/views/newSide.jsp";
//  }
//  
//  
//  
//  
//  // Create Side Processing with MAIN dropdown
//  @RequestMapping(value="/create/answer", method=RequestMethod.POST)
//  public String createSide(@Valid @ModelAttribute("answer") Answer obj, BindingResult result, Model model) {
////  	Long questionId = obj.getQuestion().getId();
//      if (result.hasErrors()) {
//          List<Question> everything = mainServ.getAll();
//          model.addAttribute("questions", everything);
//          return "/views/newSide.jsp";
//      } else {
//      	mainServ.createSide(obj);
//          return String.format("redirect:/questions/show/%s", obj.getQuestion().getId());
//      }
//  }
//  
//
//  
//
//
//  
//  // Get all Sides
//  @RequestMapping("/answers")
//  public String getAllSides(Model model) {
//  	
//  	List<Answer> allSides = mainServ.getAllSides();
//      model.addAttribute("answers", allSides);
//      return "/views/others.jsp";
//  }
//  
//  // Get one Side
//  @RequestMapping("/answers/show/{id}")
//  public String getOneSide(@PathVariable("id") Long id, Model model) {
//  	Answer side = mainServ.getOneSide(id);
//  	Question question = side.getQuestion();
//  	
//      // Just testing
//  	List<Answer> allSideMains = mainServ.getAllSides();
//      model.addAttribute("answers", allSideMains);
//  	// End
//
//  	model.addAttribute("answer", side);
//      model.addAttribute("question", question);
//      return "/views/others.jsp";
//  }
//  
//  
//  // Delete Side
//  @RequestMapping(value="/answers/{id}", method=RequestMethod.DELETE)
//  public String destroySide(@PathVariable("id") Long id) {
//  	Answer side = mainServ.getOneSide(id);
//  	Question question = side.getQuestion();
//  	Question questionId= mainServ.getOne(id);
//  	mainServ.delete(id);
//  	
//  	return String.format("redirect:/questions/%s", questionId.getId());
////      return "redirect:/questions";
//  }
  
//  // Create new Side on Main Show Page
//  @RequestMapping(value="/create/answerForQuestion", method=RequestMethod.POST)
//	public String createTag(@Valid @ModelAttribute("answer") Answer answer, BindingResult result, Model viewModel) {
//		Long mainId = answer.getQuestion().getId();
//		if (result.hasErrors()) {
//			viewModel.addAttribute("dog", this.mainServ.getOne(mainId));
//			return "show.jsp";
//		}
//		this.mainServ.createSide(answer);
//		return "redirect:/questions/show/" + mainId;
//	}





//@PostMapping("/addTag") // New tag process (from show wedding page)
//public String createTag(@Valid @ModelAttribute("tag") Tag tag, BindingResult result, Model viewModel) {
//	Long weddingId = tag.getWedding().getId();
//	if (result.hasErrors()) {
//		viewModel.addAttribute("wedding", this.mainServ.getOne(weddingId));
//		return "show.jsp";
//	}
//	this.tagService.createTag(tag);
//	return "redirect:/" + weddingId;
//}

}


