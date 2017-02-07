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
package org.jcms.system.web.servlet;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jcms.system.utils.VerifyCodeUtil;
import org.jcms.system.web.constants.SystemContant;

/**
 * @Author Abihu[谭朝红] - - -2017年2月7日-上午9:56:56
 * @Info http://www.abihu.org
 * @Description:
 */
public class VerifyCodeServlet extends HttpServlet implements Servlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8146953940070978093L;
	
	public void service(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		response.setHeader("Pragma", "No-cache"); 
        response.setHeader("Cache-Control", "no-cache"); 
        response.setDateHeader("Expires", 0); 
        response.setContentType("image/jpeg"); 
        //1.生成随机字符串
        String verifyCode = VerifyCodeUtil.generateVerifyCode(4);
		//2.把字符串存入会话
        HttpSession session = request.getSession(true);
        //3.清除之前的验证码信息
        session.removeAttribute(SystemContant.VERIFY_CODE);
        //4.存入当前新的验证码字符串
        session.setAttribute(SystemContant.VERIFY_CODE, verifyCode);
        //5.生成验证码图片
        int w=100,h=30;
        VerifyCodeUtil.outputImage(w, h, response.getOutputStream(), verifyCode);
	}
}
