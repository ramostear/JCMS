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
package org.jcms.system.admin.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.jcms.system.admin.dao.RoleDao;
import org.jcms.system.admin.entity.Role;
import org.jcms.system.admin.service.RoleService;
import org.springframework.stereotype.Service;

/**
 * @Author Abihu[谭朝红] - - -2017年2月28日-下午3:18:42
 * @Info http://www.abihu.org
 * @Description:
 */
@Service(value="roleService")
public class RoleServiceImpl implements RoleService {

	private RoleDao roleDao;
	
	/**
	 * @param roleDao the roleDao to set
	 */
	@Resource
	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}
	
	
	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.RoleService#saveRole(org.jcms.system.admin.entity.Role)
	 */
	@Override
	public Role saveRole(Role role) {
		return this.roleDao.save(role);
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.RoleService#updateRole(org.jcms.system.admin.entity.Role)
	 */
	@Override
	public Role updateRole(Role role) {
		return this.roleDao.update(role);
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.RoleService#deleteRole(org.jcms.system.admin.entity.Role)
	 */
	@Override
	public boolean deleteRole(Role role) {
		Role r = this.findOne(role.getId());
		if(r!=null){
			return this.roleDao.delete(r);
		}else{
			return false;
		}
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.RoleService#deleteRoleById(java.lang.Integer)
	 */
	@Override
	public boolean deleteRoleById(Integer id) {
		Role role = new Role(id, null, null, null, 0, null,null);
		return this.deleteRole(role);
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.RoleService#findOne(java.lang.Integer)
	 */
	@Override
	public Role findOne(Integer id) {
		return this.roleDao.find(id);
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.RoleService#findAll()
	 */
	@Override
	public List<Role> findAll() {
		return this.roleDao.findAll();
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.RoleService#getPermission(java.lang.Integer)
	 */
	@Override
	public Set<Integer> getPermission(Integer roleId) {
		Role role = this.findOne(roleId);
		if(role!=null){
			return role.getIntPermissionIds();
		}else{
			return new HashSet<Integer>();
		}
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.RoleService#setPermission(java.util.Set)
	 */
	@Override
	public Role setPermission(Integer roleId,Set<Integer> permissions) {
		Role role = this.findOne(roleId);
		if(role!=null){
			role.setPermissionIdsStr(permissions);
			return this.roleDao.update(role);
		}else{
			return null;
		}
	}
}
