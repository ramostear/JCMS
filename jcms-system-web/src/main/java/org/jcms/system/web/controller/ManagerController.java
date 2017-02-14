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

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jcms.system.admin.entity.Manager;
import org.jcms.system.admin.entity.Permission;
import org.jcms.system.admin.service.ManagerService;
import org.jcms.system.admin.service.PermissionService;
import org.jcms.system.web.beans.MenuBean;
import org.jcms.system.web.constants.SystemContant;
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
	private PermissionService permissionService;
	/**
	 * @param managerService the managerService to set
	 */
	@Resource
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	
	/**
	 * @param permissionService the permissionService to set
	 */
	@Resource
	public void setPermissionService(PermissionService permissionService) {
		this.permissionService = permissionService;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("op", "添加管理员");
		return "admin/manager/list";
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
		return "admin/manager/edit";
	}
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public void saveManager(@RequestParam(value="userName")String userName,
			@RequestParam(value="nickName")String nickName,
			@RequestParam(value="password")String password,
			@RequestParam(value="roleIds")String roleIds,
			HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		Manager currm = (Manager)session.getAttribute(SystemContant.LOGIN_MANAGER);
		Manager m = new Manager();
		m.setCreateTime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		m.setCreator(currm.getNickName());
		m.setCreatorId(currm.getId());
		m.setNickName(nickName);
		m.setPassword(password);
		m.setRoleIds(roleIds);
		m.setUserName(userName);
		this.managerService.saveManager(m);
		this.writeToPage(response, "{\"status\":\"success\",\"msg\":\""+m.getNickName()+"创建成功！\"}");
	}
	@RequestMapping(value="/size",method=RequestMethod.GET)
	public void size(HttpServletResponse response){
		long size = this.managerService.size();
		this.writeToPage(response, size);
	}
	@RequestMapping("/main")
	public String main(HttpServletRequest request,Model model){
		HttpSession session = request.getSession(true);
		Manager m = (Manager)session.getAttribute(SystemContant.LOGIN_MANAGER);
		if(m==null){
			return "redirect:/console/manager/signin";
		}
		Map<String, Object>KV = new HashMap<String, Object>();
		KV.put("type", "menu");
		List<Permission> ps = this.permissionService.menus(KV);
		List<MenuBean> menus = new ArrayList<MenuBean>();
		List<Permission> temp = new ArrayList<Permission>();
		for(Permission p:ps){
			if(p.isRoot()){
				MenuBean menu = new MenuBean();
				menu.setId(p.getId());
				menu.setIcon(p.getIcon());
				menu.setName(p.getName());
				menu.setUrl(p.getUrl());
				menus.add(menu);
				temp.add(p);
			}
		}
		for(Permission p:temp){
			ps.remove(p);
		}
		for(MenuBean menu:menus){
			Set<MenuBean> sMenu = new HashSet<MenuBean>();
			for(Permission p:ps){
				if(menu.getId()==p.getParentId()){
					MenuBean subMenu = new MenuBean();
					subMenu.setIcon(p.getIcon());
					subMenu.setId(p.getId());
					subMenu.setName(p.getName());
					subMenu.setUrl(p.getUrl());
					sMenu.add(subMenu);
				}
			}
			menu.setSubMenu(sMenu);
		}
		session.setAttribute(SystemContant.MENUS, menus); 
		return "index";
	}

}
