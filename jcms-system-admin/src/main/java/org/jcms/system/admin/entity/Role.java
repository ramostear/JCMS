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
package org.jcms.system.admin.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @Author Abihu[谭朝红] - - -2017年2月4日-上午9:10:55
 * @Info http://www.abihu.org
 * @Description:
 */
@Entity
@Table(name="t_role")
public class Role {
	@Id
	@GeneratedValue
	private int id;
	private String roleName;
	private String createTime;
	private String creator;
	private int createId;
	private String permissionIds;
	
	/**
	 * 
	 */
	public Role() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param id
	 * @param roleName
	 * @param createTime
	 * @param creator
	 * @param createId
	 * @param permissionIds
	 */
	public Role(int id, String roleName, String createTime, String creator,
			int createId, String permissionIds) {
		super();
		this.id = id;
		this.roleName = roleName;
		this.createTime = createTime;
		this.creator = creator;
		this.createId = createId;
		this.permissionIds = permissionIds;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + createId;
		result = prime * result
				+ ((createTime == null) ? 0 : createTime.hashCode());
		result = prime * result + ((creator == null) ? 0 : creator.hashCode());
		result = prime * result + id;
		result = prime * result
				+ ((permissionIds == null) ? 0 : permissionIds.hashCode());
		result = prime * result
				+ ((roleName == null) ? 0 : roleName.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Role other = (Role) obj;
		if (createId != other.createId)
			return false;
		if (createTime == null) {
			if (other.createTime != null)
				return false;
		} else if (!createTime.equals(other.createTime))
			return false;
		if (creator == null) {
			if (other.creator != null)
				return false;
		} else if (!creator.equals(other.creator))
			return false;
		if (id != other.id)
			return false;
		if (permissionIds == null) {
			if (other.permissionIds != null)
				return false;
		} else if (!permissionIds.equals(other.permissionIds))
			return false;
		if (roleName == null) {
			if (other.roleName != null)
				return false;
		} else if (!roleName.equals(other.roleName))
			return false;
		return true;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName + ", createTime="
				+ createTime + ", creator=" + creator + ", createId="
				+ createId + ", permissionIds=" + permissionIds + "]";
	}
	
	public void setPermissionIdsStr(Set<Integer>ids){
		String perIds = "";
		for(int id:ids){
			perIds += id+",";
		}
		int i = perIds.lastIndexOf(",");
		perIds = perIds.substring(0, i);
		this.permissionIds = perIds;
	}
	
	public Set<Integer> getIntPermissionIds(){
		Set<Integer> perIds = new HashSet<Integer>();
		String[] pids = this.permissionIds.split(",");
		for(String id:pids){
			perIds.add(Integer.parseInt(id));
		}
		return perIds;
	}

}
