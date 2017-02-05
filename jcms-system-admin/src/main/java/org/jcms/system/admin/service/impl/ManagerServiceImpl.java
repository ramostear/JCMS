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

import org.jcms.system.admin.dao.ManagerDao;
import org.jcms.system.admin.entity.Manager;
import org.jcms.system.admin.service.ManagerService;
import org.springframework.stereotype.Service;

/**
 * @Author Abihu[谭朝红] - - -2017年2月6日-上午12:51:39
 * @Info http://www.abihu.org
 * @Description:
 */
@Service(value="managerService")
public class ManagerServiceImpl implements ManagerService{
	
	private ManagerDao managerDao;
	
	/**
	 * @param managerDao the managerDao to set
	 */
	@Resource
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}
	

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.ManagerService#saveManager(org.jcms.system.admin.entity.Manager)
	 */
	@Override
	public Manager saveManager(Manager manager) {
		this.managerDao.save(manager);
		return manager;
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.ManagerService#updateManager(org.jcms.system.admin.entity.Manager)
	 */
	@Override
	public Manager updateManager(Manager manager) {
		this.managerDao.update(manager);
		return manager;
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.ManagerService#deleteManager(org.jcms.system.admin.entity.Manager)
	 */
	@Override
	public boolean deleteManager(Manager manager) {
		return this.managerDao.delete(manager);
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.ManagerService#findById(java.lang.Integer)
	 */
	@Override
	public Manager findById(Integer id) {
		return this.managerDao.find(id);
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.ManagerService#findByName(java.lang.String)
	 */
	@Override
	public Manager findByName(String name) {
		Map<String, Object> KV = new HashMap<String, Object>();
		KV.put("userName", name);
		List<Manager> list = this.managerDao.listByKV(KV);
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.ManagerService#listAll()
	 */
	@Override
	public List<Manager> listAll() {
		return this.managerDao.findAll();
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.ManagerService#pageList(int, int)
	 */
	@Override
	public List<Manager> pageList(int start, int limit) {
		return this.managerDao.pageListByKV(start, limit, null);
	}

	/* (non-Javadoc)
	 * @see org.jcms.system.admin.service.ManagerService#size()
	 */
	@Override
	public long size() {
		return this.managerDao.size(null);
	}

}
