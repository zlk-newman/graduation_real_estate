package com.zlk.control;

import com.zlk.bean.AdminBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminControl {
    @RequestMapping("/into_admin")
    public ModelAndView Into1(){
        ModelAndView mav = new ModelAndView();
        String s="login";
        mav.setViewName(s);
        return mav;
    }
    @RequestMapping("/adminLogin")
    public ModelAndView AdminLogin(AdminBean a){
        ModelAndView mav=new ModelAndView();
        if (a!=null){
            System.out.println("后台登录处理：" + a.getAdminName() + ":" + a.getAdminPwd());
        if(!a.getAdminName().equals("admin")){
            mav.addObject("error_login", "1");
            mav.setViewName("login");
        }else if(!a.getAdminPwd().equals("zlk123")){
            mav.addObject("error_login", "2");
            mav.setViewName("login");
        }else{
            mav.addObject("loginedname", a.getAdminName());
            mav.addObject("adminLoginedPwd", a.getAdminPwd());
            mav.addObject("success_logined", "1");
            mav.setViewName("main_admin");
        }
        }else{
            System.out.println("null");
        }
        return mav;
    }
}
