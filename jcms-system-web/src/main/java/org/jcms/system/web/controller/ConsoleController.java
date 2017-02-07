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

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Author Abihu[谭朝红] - - -2017年2月6日-下午3:14:54
 * @Info http://www.abihu.org
 * @Description:
 */
@Controller
@RequestMapping("/console/manager")
public class ConsoleController {
	
	@RequestMapping(value="/signin",method=RequestMethod.GET)
	public String login(){
		return "login";
	}
	@RequestMapping(value="/signin",method=RequestMethod.POST)
	public String login(Model model,HttpServletRequest request){
		return "index";
	}
	@RequestMapping(value="/signon",method=RequestMethod.POST)
	public String logout(){
		return "redirect:/console/manager/signin";
	}

}
