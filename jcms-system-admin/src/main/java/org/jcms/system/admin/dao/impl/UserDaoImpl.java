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
package org.jcms.system.admin.dao.impl;

import org.jcms.base.dao.impl.BaseDaoImpl;
import org.jcms.system.admin.dao.UserDao;
import org.jcms.system.admin.entity.User;
import org.springframework.stereotype.Repository;

/**
 * @Author Abihu[谭朝红] - - -2017年2月4日-下午5:56:35
 * @Info http://www.abihu.org
 * @Description:
 */
@Repository(value="userDao")
public class UserDaoImpl extends BaseDaoImpl<User, Integer> implements UserDao{

}
