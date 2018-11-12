package com.xiao.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.NativeWebRequest;

import com.google.gson.Gson;
import com.xiao.entity.Identity;
import com.xiao.entity.Person;
import com.xiao.entity.User;
import com.xiao.service.IService;

@Controller
public class ControllerUtil {
	private List<User> allusers=new ArrayList<User>();
	@Resource
	IService service;

	@RequestMapping("welcome")
	public String welcome() {
			return "login";
	}
	
	@RequestMapping("comebackLogin")
	public String comebackLogin() {
		return "login";
	}
	
	@RequestMapping("login")
	public String login(@Valid Person person, BindingResult result,ModelMap map,@ModelAttribute("user")User user,HttpServletRequest request){
		User verifyUser=null;
		verifyUser=service.checkUser(user);
		System.out.println("user:"+verifyUser);
		System.out.println("user name:"+user.getName());
		System.out.println("user password :"+user.getPassword());
		allusers=service.selectAllUsers();
		System.out.println("********"+allusers.size()+"*********");
		if(verifyUser!=null) {
			request.setAttribute("users",new Gson().toJson(allusers));
			request.setAttribute("CUser",verifyUser);
			return "success2";
		}	
		if (result.hasErrors()) {
			List<FieldError> errorList = result.getFieldErrors();
            for(FieldError error : errorList){
                System.out.println(error.getField() + "*" + error.getDefaultMessage());
                map.put("ERR_" + error.getField(), error.getDefaultMessage());
            }
            
            return "CompleteLogin";
		}
		return "error";
	}
	
	@RequestMapping("identity")
	public void identity(HttpServletResponse response,@RequestParam String user)throws IOException{
		System.out.println("this is identity");
		ArrayList<Identity> allIdentity = (ArrayList<Identity>)service.selectAllIdentity();
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("total", allIdentity.size());
		map.put("rows", allIdentity);
		response.setContentType("text/json;charset=utf-8");
		String s=new Gson().toJson(map);
		response.getWriter().print(s);
		response.getWriter().close();
		System.out.println(s);
	}
	
	@RequestMapping("createTable")
	public void table(HttpServletResponse response)throws IOException{
		allusers=service.selectAllUsers();
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("total",allusers.size());
		map.put("rows", allusers);
		response.setContentType("text/json;charset=utf-8");
		String s=new Gson().toJson(map);
		response.getWriter().print(s);
		response.getWriter().close();
	}
	
	@RequestMapping("handle")
	public void handle(HttpServletRequest request,HttpServletResponse response)throws IOException{
		if(request.getParameter("delete")!=null) {
			String json=request.getParameter("delete").toString();
			User user=new Gson().fromJson(json, User.class);
			service.deleteUser(user.getId());
			response.getWriter().print("123");
			response.getWriter().close();
		}
		if(request.getParameter("createUser")!=null) {
			response.getWriter().print("123");
			response.getWriter().close();
		}
		if(request.getParameter("edit")!=null) {
			String json=request.getParameter("edit").toString();
			User user=new Gson().fromJson(json, User.class);
			service.updateUser(user);
			response.getWriter().print("123");
			response.getWriter().close();
		}
	}
	
	@RequestMapping("createUer")
	public String createUser(@RequestParam String userId,@RequestParam String password,@RequestParam String email,HttpServletResponse response) {
		User user=new User();
		user.setEmail(email);
		user.setName(userId);
		user.setPassword(password);
		service.createUser(user);		
		return "success2";
	}
}
