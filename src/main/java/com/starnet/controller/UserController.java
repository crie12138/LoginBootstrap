package com.starnet.controller;

import com.starnet.bean.User;
import com.starnet.dto.ResultDTO;
import com.starnet.service.UserService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;

import java.lang.String.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/findall")
    @ResponseBody
    public List<User> listall() {
        List<User> list = userService.listUser();
        return list;
    }

    @RequestMapping(value = "/index")
    @ResponseBody
    public ResultDTO<JSONArray> toIndex(String username , String password, Model model) {
        ResultDTO<JSONArray> resultDTO = new ResultDTO();
        model.addAttribute("username", username);
        model.addAttribute("password", password);
        resultDTO.setMessage("");
        if (username.equals("admin" )&& password.equals("123")) {
            resultDTO.setStatus(0);
        }
        else{
            resultDTO.setStatus(1);
        }
        return resultDTO;
    }

    @RequestMapping(value = "/turn")
    public String turn() {
        return "index";
    }

    @RequestMapping(value = "/delPerson")
    @ResponseBody
    public ResultDTO<Integer> delPerson(String ids){
        ResultDTO<Integer> resultDTO = new ResultDTO();
        try {
            userService.delByID(ids);
            resultDTO.setStatus(0);
            resultDTO.setData(1);
        }catch (Exception e) {
            e.printStackTrace();
            resultDTO.setStatus(1);
        }
        return resultDTO;
    }

    @RequestMapping(value = "/addPerson")
    @ResponseBody
    public ResultDTO<Integer> addPerson(String username,String sex,String age ,String phone, String address,String password){
        ResultDTO<Integer> resultDTO = new ResultDTO();
        try {
            User user = new User();
            user.setUsername(username);
            user.setSex(sex);
            user.setAge(Integer.parseInt(age));
            user.setPhone(phone);
            user.setAddress(address);
            user.setPassword(password);
            int issuccess = userService.add(user);
            resultDTO.setStatus(0);
            resultDTO.setMessage("操作成功！");
            resultDTO.setData(issuccess);
        } catch (Exception e) {
            e.printStackTrace();
            resultDTO.setStatus(1);
            resultDTO.setMessage("操作失败！");
        }
        return resultDTO;
    }

    //    updatePerson
    @RequestMapping(value = "/updatePerson")
    @ResponseBody
    public ResultDTO<Integer> updatePerson(String id,String username,String sex,String age ,String phone, String address,String password) {
        ResultDTO<Integer> resultDTO = new ResultDTO();
        try {
            User user = new User();
            user.setId(Integer.parseInt(id));
            user.setUsername(username);
            user.setSex(sex);
            user.setAge(Integer.parseInt(age));
            user.setPhone(phone);
            user.setAddress(address);
            user.setPassword(password);
            int issuccess = userService.upUser(user);
            resultDTO.setStatus(0);
            resultDTO.setMessage("操作成功！");
            resultDTO.setData(issuccess);
        } catch (Exception e) {
            e.printStackTrace();
            resultDTO.setStatus(1);
            resultDTO.setMessage("操作失败！");
        }
        return resultDTO;
    }
}
