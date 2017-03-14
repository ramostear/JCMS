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
package org.jcms.system.web.realm;

import java.util.HashSet;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.jcms.system.admin.entity.Manager;
import org.jcms.system.admin.entity.Permission;
import org.jcms.system.admin.entity.Role;
import org.jcms.system.admin.service.ManagerService;
import org.jcms.system.admin.service.PermissionService;
import org.jcms.system.admin.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Author Abihu[谭朝红] - - -2017年3月13日-下午12:09:42
 * @Info http://www.abihu.org
 * @Description:
 */
public class ManagerRealm extends AuthorizingRealm{
	@Autowired
	private ManagerService managerService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private PermissionService permissionService;
	/**
	 * @return the managerService
	 */
	public ManagerService getManagerService() {
		return managerService;
	}

	/**
	 * @param managerService the managerService to set
	 */
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}

	/**
	 * @return the roleService
	 */
	public RoleService getRoleService() {
		return roleService;
	}

	/**
	 * @param roleService the roleService to set
	 */
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	/**
	 * @return the permissionService
	 */
	public PermissionService getPermissionService() {
		return permissionService;
	}

	/**
	 * @param permissionService the permissionService to set
	 */
	public void setPermissionService(PermissionService permissionService) {
		this.permissionService = permissionService;
	}

	/* (non-Javadoc)
	 * @see org.apache.shiro.realm.AuthorizingRealm#doGetAuthorizationInfo(org.apache.shiro.subject.PrincipalCollection)
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		String userName = (String)principalCollection.getPrimaryPrincipal();
		SimpleAuthorizationInfo  authorizationInfo = new SimpleAuthorizationInfo();
		Set<Integer> roleIds = managerService.findByName(userName).RoleIdsAsSet();
		Set<String> roles = new HashSet<String>();
		Set<String> permissions = new HashSet<String>();
		Set<Integer> permIds = new HashSet<Integer>(); 
		for(int rid:roleIds){
			Role role = roleService.findOne(rid);
			if(role!=null){
				roles.add(role.getRoleName());
				permIds.addAll(role.getIntPermissionIds());
			}
		}
		for(Integer id:permIds){
			Permission p = permissionService.findById(id);
			if(p!=null){
				permissions.add(p.getPermission());
			}
		}
		authorizationInfo.setRoles(roles);
		authorizationInfo.setStringPermissions(permissions);
		return authorizationInfo;
	}

	/* (non-Javadoc)
	 * @see org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken)
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		String userName = (String)token.getPrincipal();
		System.out.println(userName+"=="+token.getCredentials());
		Manager m = managerService.findByName(userName);
		if(m==null){
			System.out.println(m.getUserName()+","+m.getPassword());
			throw new UnknownAccountException();
		}
		
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
				m.getUserName(), 
				m.getPassword(), 
				ByteSource.Util.bytes(m.getSalt()), 
				getName());
		
		return authenticationInfo;
	}
	
	 @Override
	    public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
	        super.clearCachedAuthorizationInfo(principals);
	    }

	    @Override
	    public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
	        super.clearCachedAuthenticationInfo(principals);
	    }

	    @Override
	    public void clearCache(PrincipalCollection principals) {
	        super.clearCache(principals);
	    }

	    public void clearAllCachedAuthorizationInfo() {
	        getAuthorizationCache().clear();
	    }

	    public void clearAllCachedAuthenticationInfo() {
	        getAuthenticationCache().clear();
	    }

	    public void clearAllCache() {
	        clearAllCachedAuthenticationInfo();
	        clearAllCachedAuthorizationInfo();
	    }

}
