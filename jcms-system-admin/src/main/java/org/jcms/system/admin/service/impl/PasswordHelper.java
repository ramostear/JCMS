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

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.jcms.system.admin.entity.Manager;
import org.springframework.stereotype.Service;

/**
 * @Author Abihu[谭朝红] - - -2017年3月13日-上午11:51:32
 * @Info http://www.abihu.org
 * @Description:
 */
@Service
public class PasswordHelper {
	
	private RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();
	
	private String algorithmName = "md5";
	
	private int hashIterations = 2;
	
	/**
	 * @param randomNumberGenerator the randomNumberGenerator to set
	 */
	public void setRandomNumberGenerator(
			RandomNumberGenerator randomNumberGenerator) {
		this.randomNumberGenerator = randomNumberGenerator;
	}
	
	/**
	 * @param algorithmName the algorithmName to set
	 */
	public void setAlgorithmName(String algorithmName) {
		this.algorithmName = algorithmName;
	}
	
	/**
	 * @param hashIterations the hashIterations to set
	 */
	public void setHashIterations(int hashIterations) {
		this.hashIterations = hashIterations;
	}
	public void encryptPassword(Manager manager){
		manager.setSalt(randomNumberGenerator.nextBytes().toHex());
		String newPassword = new SimpleHash(algorithmName,
				manager.getPassword(),
				ByteSource.Util.bytes(manager.getSalt()), 
				hashIterations).toHex();
		manager.setPassword(newPassword);
	}
	
	
	
	
	
	
	
	
	
	

}
