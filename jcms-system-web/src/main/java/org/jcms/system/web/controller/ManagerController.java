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

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.jcms.system.admin.entity.Manager;
import org.jcms.system.admin.service.ManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Author Abihu[谭朝红] - - -2017年2月6日-上午1:20:33
 * @Info http://www.abihu.org
 * @Description:
 */
@Controller
@RequestMapping("/admin/manager")
public class ManagerController extends BaseController{
	
	private ManagerService managerService;
	/**
	 * @param managerService the managerService to set
	 */
	@Resource
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("op", "添加管理员");
		return "manager/list";
	}

	@RequestMapping(value="/list",method=RequestMethod.GET)
	public void list(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "pageSize", defaultValue = "15") int pageSize,
			HttpServletResponse response) {
		List<Manager> list = this.managerService.pageList((page-1)*pageSize, pageSize);
		this.writeToPage(response, list);
	}
	@RequestMapping(value="/save",method=RequestMethod.GET)
	public String saveManager(Model model){
		model.addAttribute("op", "添加管理员");
		return "manager/edit";
	}
	
	public void saveManager(@RequestParam(value="userName")String userName,
			@RequestParam(value="nickName")String nickName,
			@RequestParam(value="password")String password,
			@RequestParam(value="roleIds")String roleIds){
		
		
		
		
		
	}

}
