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
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jcms.system.admin.entity.Manager;
import org.jcms.system.admin.entity.Permission;
import org.jcms.system.admin.entity.Role;
import org.jcms.system.admin.service.PermissionService;
import org.jcms.system.admin.service.RoleService;
import org.jcms.system.web.beans.TreeNodeBean;
import org.jcms.system.web.constants.SystemContant;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Author Abihu[谭朝红] - - -2017年2月28日-下午5:00:20
 * @Info http://www.abihu.org
 * @Description:
 */
@Controller
@RequestMapping(value="/admin/role")
public class RoleController extends BaseController{

	private RoleService roleService;
	
	private PermissionService permissionService;
	
	/**
	 * @param roleService the roleService to set
	 */
	@Resource
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	
	/**
	 * @param permissionService the permissionService to set
	 */
	@Resource
	public void setPermissionService(PermissionService permissionService) {
		this.permissionService = permissionService;
	}
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index(Model model){
		model.addAttribute("op", "创建新角色");
		List<Role> list = this.roleService.findAll();
		model.addAttribute("list", list);
		return "admin/role/list";
	}
	@RequestMapping(value="/create",method=RequestMethod.GET)
	public String add(Model model,HttpServletResponse response){
		model.addAttribute("op", "创建角色");
		return "admin/role/edit";
	}
	@RequestMapping(value="/create",method=RequestMethod.POST)
	public void add(@RequestParam(value="roleName")String roleName,
			@RequestParam(value="perm")String perm,
			@RequestParam(value="description")String description,
			HttpServletResponse response,
			HttpServletRequest request){
		Role role = new Role();
		role.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		role.setRoleName(roleName);
		role.setPermissionIds(perm);
		role.setDescription(description);
		HttpSession session = request.getSession();
		Manager m = (Manager)session.getAttribute(SystemContant.LOGIN_MANAGER);
		role.setCreateId(m.getId());
		role.setCreator(m.getNickName());
		this.roleService.saveRole(role);
		this.writeToPage(response, "{\"status\":\"success\",\"msg\":\"角色添加成功\"}");
	}
	@RequestMapping(value="/getPermissions",method=RequestMethod.GET)
	public void getPermissions(HttpServletResponse response){
		List<Permission> list = this.permissionService.findAll();
		List<TreeNodeBean>treeNodes = new ArrayList<TreeNodeBean>();
		for(Permission p:list){
			TreeNodeBean node = new TreeNodeBean(p.getId()+"", p.getName(), p.getParentId()+"");
			treeNodes.add(node);
		}
		this.writeToPage(response, treeNodes);
	}
	@RequestMapping(value="/edit/{id}",method=RequestMethod.GET)
	public String editRole(@PathVariable(value="id") int id,Model model){
		model.addAttribute("op", "编辑角色");
		Role role = this.roleService.findOne(id);
		model.addAttribute("role", role);
		return "admin/role/edit";
	}
	@RequestMapping(value="/getRolePermissionTree",method=RequestMethod.GET)
	public void getRolePermissionTree(@RequestParam(value="id")int id,HttpServletResponse response){
		List<Permission> plist = this.permissionService.findAll();
		Role role = this.roleService.findOne(id);
		Set<Integer>pids = role.getIntPermissionIds();
		List<TreeNodeBean> nodes = new ArrayList<TreeNodeBean>();
		for(Permission p:plist){
			TreeNodeBean node = new TreeNodeBean(p.getId()+"", p.getName(), p.getParentId()+""); 
			if(pids.contains(Integer.parseInt(node.getId()))){node.setChecked(true);}
			nodes.add(node);
		}
		this.writeToPage(response, nodes);
	}
	@RequestMapping(value="/edit/{id}",method=RequestMethod.POST)
	public void editRole(@PathVariable(value="id")int id,
			@RequestParam(value="roleName")String roleName,
			@RequestParam(value="perm")String perm,
			@RequestParam(value="description")String description,
			HttpServletResponse response){
		Role role = this.roleService.findOne(id);
		role.setRoleName(roleName);
		role.setPermissionIds(perm);
		role.setDescription(description);
		this.roleService.updateRole(role);
		this.writeToPage(response, "{\"status\":\"success\",\"msg\":\"角色编辑成功\"}");
	}
	@RequestMapping(value="/{id}",method=RequestMethod.GET)
	public String showRole(@PathVariable(value="id")int id,Model model){
		Role role = this.roleService.findOne(id);
		Set<Integer> pids = role.getIntPermissionIds();
		List<Permission> perms = new ArrayList<Permission>();
		for(int pid:pids){
			Permission p = this.permissionService.findById(pid);
			if(p!=null){
				perms.add(p);
			}
		}
		model.addAttribute("role", role).addAttribute("perms", perms).addAttribute("op", "角色信息");
		return "admin/role/info";
	}
	@RequestMapping(value="/delete/{id}",method=RequestMethod.POST)
	public void delete(@PathVariable(value="id")int id,HttpServletResponse response){
		Role role = this.roleService.findOne(id);
		if(role!=null){
			this.roleService.deleteRole(role);
		}
		this.writeToPage(response, "{\"status\":\"success\"}");
	}
	
}
