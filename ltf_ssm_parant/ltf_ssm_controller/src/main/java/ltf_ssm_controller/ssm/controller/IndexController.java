package ltf_ssm_controller.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ltf_ssm_api.service.UserService;
import ltf_ssm_entity.entity.T_WorkInfo;

@Controller
public class IndexController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/toEdit")
	public String toEdit(String id, Model model) {
		T_WorkInfo inf = userService.findById(Integer.parseInt(id));
		model.addAttribute("inf", inf);
		return "edit";
	}

	@RequestMapping("/editA")
	public String editA(@RequestParam String id, @RequestParam String name, @RequestParam String brief, @RequestParam String img, Model model) {
		userService.updateInf(Integer.parseInt(id), name, brief, img);

		List<T_WorkInfo> w = userService.findAll();
		w.toString();
		model.addAttribute("ls", w);
		return "inf";
	}

	@RequestMapping("/toInf")
	public String toInf(Model model) {
		List<T_WorkInfo> w = userService.findAll();
		w.toString();
		model.addAttribute("ls", w);
		return "inf";
	}
	
	@RequestMapping("/toAdd")
	public String toAdd(Model model) {
		return "add";
	}
	
	@RequestMapping("/add")
	public String add(@RequestParam String name,@RequestParam String brief,@RequestParam String img, Model model) {
		userService.insertInf(name, brief, img);
		List<T_WorkInfo> w = userService.findAll();
		w.toString();
		model.addAttribute("ls", w);
		return "inf";
	}
	
	@RequestMapping("/delete")
	public String toAdd(@RequestParam int id, Model model) {
		userService.deleteInfByID(id);
		List<T_WorkInfo> w = userService.findAll();
		w.toString();
		model.addAttribute("ls", w);
		return "inf";
	}

}
