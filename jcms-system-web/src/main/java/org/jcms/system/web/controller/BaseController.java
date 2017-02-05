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
package org.jcms.system.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;

/**
 * @Author Abihu[谭朝红] - - -2017年2月6日-上午3:20:47
 * @Info http://www.abihu.org
 * @Description:
 */
public class BaseController {
	
	public void writeToPage(HttpServletResponse response, Object object) {
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.write(JSONArray.toJSONString(object));
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void writeToPage(HttpServletResponse response, String str) {
		response.setCharacterEncoding("utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.write(JSONArray.parse(str).toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	} 

}
