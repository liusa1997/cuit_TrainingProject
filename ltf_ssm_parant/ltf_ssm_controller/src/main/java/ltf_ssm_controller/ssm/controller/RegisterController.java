package ltf_ssm_controller.ssm.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ltf_ssm_api.service.UserService;
import ltf_ssm_entity.entity.T_User;
import ltf_ssm_entity.entity.T_WorkInfo;

@Controller
public class RegisterController extends HttpServlet {
	@Autowired
	private UserService userService;

	@RequestMapping("/toRegister")
	public String toRegister() {
		return "register";
	}

	// 注册
	@RequestMapping("/registerMethod")
	public String reg(@RequestParam String username, @RequestParam String email, @RequestParam String password,
			Model model, HttpSession session) {

		T_User user = new T_User();
		user.setEmail(email);
		user.setName(username);
		user.setPassword(password);
		user.setR_id(1);

		if (userService.findUserByEmial(username) == 0) {
			userService.reg(user);
			session.setAttribute("username", user.getName());
			session.setAttribute("email", user.getEmail());
			List<T_WorkInfo> w = userService.findAll();
			w.toString();
			model.addAttribute("ls", w);
			return "inf";
		} else {
			return "register";
		}

	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取请求的方法
		int VetifyCode = (int) (1000 + Math.random() * 8999);
		HttpSession session = request.getSession();
		session.setAttribute("Digital", VetifyCode);

		HtmlEmail email = new HtmlEmail();// 创建一个HtmlEmail实例对象
		email.setHostName("smtp.qq.com");
		email.setCharset("utf-8");// 设置发送的字符类型
		String dest = request.getParameter("email");
		String pattern = "(\\d{8,12}@qq.com)|(\\w{8,}@gmail.com)|(\\w{8,}@yahoo.com)";
		Pattern r = Pattern.compile(pattern);
		Matcher m = r.matcher(dest);
		if(!m.find())
		{
			response.getWriter().write("failed");
			return;
		}
		
		try {
			email.addTo(dest);
			email.setFrom("2867763143@qq.com", "OfficialByLTF漫网");// 发送人的邮箱为自己的，用户名可以随便填
			email.setAuthentication("2867763143@qq.com", "nqsfhpboxertdgbg");// 设置发送人到的邮箱和用户名和授权码(授权码是自己设置的)
			email.setSubject("邮箱验证");// 设置发送主题
			email.setMsg(
					"您通过LTF漫网注册了该邮箱，以下是您的验证码：" + session.getAttribute("Digital") + "，请输入该验证码进行验证，如果这不是您的操作，请忽略或者删除该邮件。");// 设置发送内容
			email.send();// 进行发送
		} catch (EmailException e) {
			e.printStackTrace();
		}// 设置收件人
		response.getWriter().write("success");
    }

}
