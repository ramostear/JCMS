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

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.jcms.system.admin.entity.Permission;
import org.jcms.system.admin.service.PermissionService;
import org.jcms.system.web.beans.TreeNodeBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @Author Abihu[谭朝红] - - -2017年2月8日-下午2:02:52
 * @Info http://www.abihu.org
 * @Description:
 */
@Controller
@RequestMapping("/admin/permission")
public class PermissionController extends BaseController{
	
	private PermissionService permissionService;
	
	/**
	 * @param permissionService the permissionService to set
	 */
	@Resource
	public void setPermissionService(PermissionService permissionService) {
		this.permissionService = permissionService;
	}
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index(){
		return "admin/permission/list";
	}
	@RequestMapping(value="/treeNode",method=RequestMethod.GET)
	public void treeNode(HttpServletResponse response){
		List<Permission> list = this.permissionService.findAll();
		List<TreeNodeBean> nodeList = new ArrayList<TreeNodeBean>();
		if(!list.isEmpty()){
			for(Permission p:list){
				TreeNodeBean node = new TreeNodeBean(p.getId()+"",p.getName(),p.getParentId()+"");
				nodeList.add(node);
			}
		}
		this.writeToPage(response, nodeList);
	}
	@RequestMapping(value="/create",method=RequestMethod.POST)
	public void createPermission(@RequestParam(value="name")String name,
			@RequestParam(value="icon")String icon,@RequestParam(value="url")String url,
			@RequestParam(value="permission")String permission,@RequestParam(value="type")String type,
			@RequestParam(value="parentId")String parentId,HttpServletResponse response){
		Permission p = new Permission();
		p.setIcon(icon);
		p.setName(name);
		p.setParentId(Integer.parseInt(parentId));
		p.setPermission(permission);
		p.setType(type);
		p.setUrl(url);
		this.permissionService.save(p);
		this.writeToPage(response, "{\"status\":\"success\"}");
	}
	@RequestMapping(value="/subList",method=RequestMethod.GET)
	public void subList(@RequestParam(value="parentId",defaultValue="0")String parentId,
			@RequestParam(value="page",defaultValue="1")int page,
			@RequestParam(value="pageSize",defaultValue="10")int pageSize,
			HttpServletResponse response){
		List<Permission> pl = this.permissionService.pageByParentId((page-1)*pageSize, pageSize, Integer.parseInt(parentId));
		this.writeToPage(response, pl);
	}
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public void update(@RequestParam(value="id")String id,
			@RequestParam(value="name")String name,
			@RequestParam(value="icon")String icon,
			@RequestParam(value="url")String url,
			@RequestParam(value="type")String type,
			@RequestParam(value="permission")String permission,
			HttpServletResponse response){
		Permission p = this.permissionService.findById(Integer.parseInt(id));
		if(p!=null){
			p.setIcon(icon);
			p.setName(name);
			p.setPermission(permission);
			p.setUrl(url);
			p.setType(type);
			this.permissionService.update(p);
			this.writeToPage(response, "{\"status\":\"success\"}");
		}else{
			this.writeToPage(response, "{\"status\":\"fail\"}");
		}
	}
	@RequestMapping(value="/permission",method=RequestMethod.GET)
	public void permission(@RequestParam(value="id")String id,HttpServletResponse response){
		Permission p = this.permissionService.findById(Integer.parseInt(id));
		if(p!=null){
			this.writeToPage(response, "{\"parentId\":\""+p.getParentId()+"\"}");
		}
	}
	@RequestMapping(value="/size",method=RequestMethod.GET)
	public void size(@RequestParam(value="parentId")String parentId,HttpServletResponse response){
		long size = this.permissionService.size(Integer.parseInt(parentId));
		this.writeToPage(response, "{\"size\":\""+size+"\"}");
	}
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public void delete(@RequestParam(value="id")String id,HttpServletResponse response){
		Permission p = this.permissionService.findById(Integer.parseInt(id));
		if(p!=null){
			this.permissionService.delete(p);
			this.writeToPage(response, "{\"status\":\"success\",\"msg\":\"success\"}");
		}else{
			this.writeToPage(response, "{\"status\":\"fail\",\"msg\":\"error\"}");
		}
	}
}
