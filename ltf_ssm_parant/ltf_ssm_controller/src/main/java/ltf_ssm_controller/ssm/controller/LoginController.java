package ltf_ssm_controller.ssm.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ltf_ssm_api.service.UserService;
import ltf_ssm_common.util.VCodeGenerator;
import ltf_ssm_entity.entity.T_WorkInfo;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	
	private String vcode;
	
	@RequestMapping("/toChangePassword")
	public String toChangePassword() {
		return "changePassword";
	}
	
	@RequestMapping("/toLogin")
	public String toLogin() {
		return "login";
	}
	
	@RequestMapping("/toChangeForgetPassword")
	public String toChangeForgetPassword() {
		return "changePassword";
	}
	
	@RequestMapping("/changePassword")
	public String changePassword(HttpSession session, Model model, @RequestParam String new_password) {
		String username = (String) session.getAttribute("username");
		userService.changePasswordByUsername(new_password, username);
		return "changePasswordSuccess";
	}
	
	@RequestMapping("/changePasswordByEmail")
	public String changePasswordByEmail(HttpSession session, Model model, @RequestParam String new_password, @RequestParam String email) {
		userService.changePasswordByEmail(new_password, email);
		session.removeAttribute("sid"+email);
		return "changePasswordSuccess";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, Model model) {
		session.removeAttribute("username");
		List<T_WorkInfo> w = userService.findAll();
		w.toString();
		model.addAttribute("ls", w);
		return "inf";
	}
	
	@RequestMapping("/login")
	public String login(HttpSession session, @RequestParam String username, @RequestParam String password,@RequestParam String code, Model model) {
		// 到数据库比对
		int  ret = userService.login(username, password);
		if(code.equalsIgnoreCase(vcode)) {
			if (ret>0) {
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				List<T_WorkInfo> w = userService.findAll();
				w.toString();
				model.addAttribute("ls", w);
				return "inf";
			} else {
				model.addAttribute("msg", "用户名或者密码错误");
				model.addAttribute("username", username);
				return "login";
			}
		} else {
			model.addAttribute("msg", "验证码错误");
			return "login";
		}
	}

	/**
	 * 获取验证码
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/getCode")
	private void getVCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 创建验证码生成器对象
		VCodeGenerator vcGenerator = new VCodeGenerator();
		// 生成验证码
		vcode = vcGenerator.generatorVCode();
		// 生成验证码图片
		BufferedImage vImg = vcGenerator.generatorRotateVCodeImage(vcode, true);
		// 输出图像
		ImageIO.write(vImg, "gif", response.getOutputStream());
	}

}
