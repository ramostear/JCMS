/**
 * 
 */
package org.jcms.system.admin.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * @Author Abihu[谭朝红] - - -2017年2月3日-下午5:15:28
 * @Info http://www.abihu.org
 * @Description:
 */
@Entity
@Table(name="t_manager")
public class Manager {
	@Id
	@Column
	private int id;
	
	

}
