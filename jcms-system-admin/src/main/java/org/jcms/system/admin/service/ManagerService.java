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

import org.jcms.system.admin.entity.Manager;

/**
 * @Author Abihu[谭朝红] - - -2017年2月6日-上午12:41:59
 * @Info http://www.abihu.org
 * @Description:
 */
public interface ManagerService {
	
	public Manager saveManager(Manager manager);
	
	public Manager updateManager(Manager manager);
	
	public boolean deleteManager(Manager manager);
	
	public Manager findById(Integer id);
	
	public Manager findByName(String name);
	
	public List<Manager> listAll();
	
	public List<Manager> pageList(int start,int limit);
	
	public long size();

}
