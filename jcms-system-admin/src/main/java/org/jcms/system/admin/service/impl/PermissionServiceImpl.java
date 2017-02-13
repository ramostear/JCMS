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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jcms.system.admin.dao.PermissionDao;
import org.jcms.system.admin.entity.Permission;
import org.jcms.system.admin.service.PermissionService;
import org.springframework.stereotype.Service;

/**
 * @Author Abihu[谭朝红] - - -2017年2月8日-下午2:23:08
 * @Info http://www.abihu.org
 * @Description:
 */
@Service(value="permissionService")
public class PermissionServiceImpl implements PermissionService{
	
	private PermissionDao permissionDao;
	
	/**
	 * @param permissionDao the permissionDao to set
	 */
	@Resource
	public void setPermissionDao(PermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.PermissionService#save(org.jcms.system.admin.entity.Permission)
	 */
	@Override
	public Permission save(Permission permission) {
		return this.permissionDao.save(permission);
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.PermissionService#update(org.jcms.system.admin.entity.Permission)
	 */
	@Override
	public Permission update(Permission permission) {
		return this.permissionDao.update(permission);
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.PermissionService#delete(org.jcms.system.admin.entity.Permission)
	 */
	@Override
	public boolean delete(Permission permission) {
		return this.permissionDao.delete(permission);
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.PermissionService#findById(java.lang.Integer)
	 */
	@Override
	public Permission findById(Integer id) {
		return this.permissionDao.find(id);
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.PermissionService#findAll()
	 */
	@Override
	public List<Permission> findAll() {
		return this.permissionDao.findAll();
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.PermissionService#pageByParentId(java.lang.Integer)
	 */
	@Override
	public List<Permission> pageByParentId(int start,int limit,Integer parentId) {
		Map<String, Object> KV = new HashMap<String, Object>();
		KV.put("parentId", parentId);
		List<Permission> list = this.permissionDao.pageListByKV(start, limit, KV);
		return list;
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.PermissionService#size(java.lang.Integer)
	 */
	@Override
	public long size(Integer parentId) {
		Map<String , Object> KV = new HashMap<String, Object>();
		KV.put("parentId", parentId);
		return this.permissionDao.size(KV);
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.PermissionService#size()
	 */
	@Override
	public long size() {
		return this.permissionDao.size(null);
	}

}
