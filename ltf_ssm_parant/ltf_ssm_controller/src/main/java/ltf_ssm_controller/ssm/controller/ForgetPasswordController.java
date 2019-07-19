package ltf_ssm_controller.ssm.controller;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ltf_ssm_api.service.UserService;
import ltf_ssm_entity.entity.T_WorkInfo;

@Controller
public class ForgetPasswordController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/toForgetPassword")
	public String toLogin() {
		return "forgetPassword";
	}
	
	@RequestMapping("/forgetPassword")
	public String ForgetPasswordHandler(@RequestParam String semail, HttpSession session, HttpServletRequest request)
	{
        //获取请求的方法
		String sid = Integer.toString((int) (1000 + Math.random() * 8999));
		session.setAttribute("sid"+semail, sid);
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";  
		HtmlEmail email = new HtmlEmail();// 创建一个HtmlEmail实例对象
		email.setHostName("smtp.qq.com");
		email.setCharset("utf-8");// 设置发送的字符类型
		try {
			email.addTo(semail);
			email.setFrom("2867763143@qq.com", "OfficialByLTF漫网");// 发送人的邮箱为自己的，用户名可以随便填
			email.setAuthentication("2867763143@qq.com", "nqsfhpboxertdgbg");// 设置发送人到的邮箱和用户名和授权码(授权码是自己设置的)
			email.setSubject("邮箱验证");// 设置发送主题
			email.setMsg(
					"有人通过LTF漫网使用该邮箱提交了密码重置申请，以下是链接：<a href=\"" + basePath + "changeForgetPassword?sid=" + session.getAttribute("sid"+semail) + "&email=" + semail + "\">"+basePath + "changeForgetPassword?sid=" + session.getAttribute("sid"+semail) + "&email=" + semail+"</a>，请通过此链接进行密码重置操作，如果这不是您的操作，请忽略或者删除该邮件。");// 设置发送内容
			email.send();// 进行发送
		} catch (EmailException e) {
			e.printStackTrace();
		}// 设置收件人
		return "sendForgetSuccess";
	}
	
	@RequestMapping("/changeForgetPassword")
	public String changeForgetPassword(@RequestParam(value="sid", required=false,defaultValue="0") String sid,@RequestParam(value="email", required=false,defaultValue="0") String email,HttpSession session, Model model)
	{
		// TODO: 发送带有修改密码的右键到参数email指定的地址
		if("0".equals(sid)) {
			List<T_WorkInfo> w = userService.findAll();
			w.toString();
			model.addAttribute("ls", w);
			return "inf";
		} else {
			if((sid).equals(session.getAttribute("sid"+email))) {
				if(userService.findUserByEmial(email)>1) {
					model.addAttribute("email", email);
					return "changeForgetPassword";
				} else {
					List<T_WorkInfo> w = userService.findAll();
					w.toString();
					model.addAttribute("ls", w);
					return "inf";
				}
				
			} else {
				List<T_WorkInfo> w = userService.findAll();
				w.toString();
				model.addAttribute("ls", w);
				return "inf";
			}
		}
		
	}
	
	@RequestMapping("/")
	public String redirectInf(Model model) {
		List<T_WorkInfo> w = userService.findAll();
		w.toString();
		model.addAttribute("ls", w);
		return "inf";
	}
}
