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
package org.jcms.system.web.beans;

/**
 * @Author Abihu[谭朝红] - - -2017年2月13日-上午9:27:18
 * @Info http://www.abihu.org
 * @Description:
 */
public class TreeNodeBean {

	private String id;
	private String name;
	private String parentId;
	private boolean checked = Boolean.FALSE;
	
	/**
	 * 
	 */
	public TreeNodeBean() {
	}
	
	/**
	 * @param id
	 * @param name
	 * @param parentId
	 * @param checked
	 */
	public TreeNodeBean(String id, String name, String parentId, boolean checked) {
		super();
		this.id = id;
		this.name = name;
		this.parentId = parentId;
		this.checked = checked;
	}
	
	/**
	 * @param id
	 * @param name
	 * @param parentId
	 */
	public TreeNodeBean(String id, String name, String parentId) {
		super();
		this.id = id;
		this.name = name;
		this.parentId = parentId;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the parentId
	 */
	public String getParentId() {
		return parentId;
	}
	/**
	 * @param parentId the parentId to set
	 */
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	/**
	 * @return the checked
	 */
	public boolean isChecked() {
		return checked;
	}
	/**
	 * @param checked the checked to set
	 */
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	
	
	
	
}
