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
package org.jcms.system.admin.service;

import java.util.List;
import java.util.Set;

import org.jcms.system.admin.entity.Role;

/**
 * @Author Abihu[谭朝红] - - -2017年2月28日-下午2:21:09
 * @Info http://www.abihu.org
 * @Description:
 */
public interface RoleService {

	public Role saveRole(Role role);
	
	public Role updateRole(Role role);
	
	public boolean deleteRole(Role role);
	
	public boolean deleteRoleById(Integer id);
	
	public Role findOne(Integer id);
	
	public List<Role> findAll();
	
	public Set<Integer> getPermission(Integer roleId);
	
	public Role setPermission(Integer roleId,Set<Integer> permissions);
	
	
}
