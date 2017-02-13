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

import org.jcms.system.admin.entity.Permission;

/**
 * @Author Abihu[谭朝红] - - -2017年2月8日-下午2:17:57
 * @Info http://www.abihu.org
 * @Description:
 */
public interface PermissionService {
	
	public Permission save(Permission permission);
	
	public Permission update(Permission permission);
	
	public boolean delete(Permission permission);
	
	public Permission findById(Integer id);
	
	public List<Permission> findAll();
	
	public List<Permission> pageByParentId(int start,int limit,Integer parentId);
	
	public long size(Integer parentId);
	
	public long size();

}
