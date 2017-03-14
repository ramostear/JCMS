/**
 *	Copyright [2017] [www.ramostear.com]
 *
 *	Licensed under the Apache License, Version 2.0 (the "License");<br/>
 *	you may not use this file except in compliance with the License.<br/>
 *	You may obtain a copy of the License at<br/>
 *							<br/>
 *	    http://www.apache.org/licenses/LICENSE-2.0<br/>
 *							<br/>
 *	Unless required by applicable law or agreed to in writing, software<br/>
 *	distributed under the License is distributed on an "AS IS" BASIS,<br/>
 *	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.<br/>
 *	See the License for the specific language governing permissions and<br/>
 *	limitations under the License.<br/>
 * 
 */
package org.jcms.system.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.UnknownAlgorithmException;
import org.apache.shiro.subject.Subject;
import org.jcms.system.admin.entity.Manager;
import org.jcms.system.admin.service.ManagerService;
import org.jcms.system.web.constants.SystemContant;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Author Abihu[谭朝红] - - -2017年2月6日-下午3:14:54
 * @Info http://www.abihu.org
 * @Description:
 */
@Controller
@RequestMapping("/console/manager")
public class ConsoleController extends BaseController{
	
	private ManagerService managerService;
	
	/**
	 * @param managerService the managerService to set
	 */
	@Resource
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	
	
	@RequestMapping(value="/signin",method=RequestMethod.GET)
	public String login(){
		return "login";
	}
	@RequestMapping(value="/signin",method=RequestMethod.POST)
	public String login(@RequestParam(value="userName")String userName,@RequestParam(value="password")String password,
			@RequestParam(value="verifyCode")String verifyCode,Model model,HttpServletRequest request){
		System.out.println(userName+"=="+password+"==="+verifyCode);
		HttpSession session = request.getSession(true);
		String code1 = (String)session.getAttribute(SystemContant.VERIFY_CODE);
		String error = null;
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
		if(!code1.equals(verifyCode)){
			model.addAttribute("error", "验证码不正确");
			model.addAttribute("userName", userName);
			model.addAttribute("password", password);
			return "login";
		}else{
				try {
					subject.login(token);
				} catch (UnknownAccountException e) {
					error = "用户名/密码错误";
				}catch (IncorrectCredentialsException e) {
					error = "用户名/密码错误";
				}catch (AuthenticationException e) {
					error = "数据不合法/其他错误";
				}
				if(error!=null){
					model.addAttribute("error", error).addAttribute("userName", userName).addAttribute("password", password);
					return "login";
				}else{
					return "redirect:/admin/manager/main";
				}
		}
	}
	@RequestMapping(value="/check",method=RequestMethod.GET)
	public void checkUsernameAndPwd(@RequestParam(value="userName")String userName,
			@RequestParam(value="password")String password,
			HttpServletResponse response){
		Manager m = this.managerService.findByName(userName);
		if(m==null||!m.getPassword().equals(password)){
			this.writeToPage(response, "{\"status\":\"100\",\"info\":\"用户名或密码不正确\"}");
		}else{
			this.writeToPage(response, "{\"status\":\"200\",\"info\":\"ok\"}");
		}
	}
	@RequestMapping(value="/signon",method=RequestMethod.GET)
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession(true);
		session.removeAttribute(SystemContant.LOGIN_MANAGER);
		return "redirect:/console/manager/signin";
	}
}
