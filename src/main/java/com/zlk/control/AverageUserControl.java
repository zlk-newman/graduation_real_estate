package com.zlk.control;

import com.zlk.bean.*;

import com.zlk.service.*;
import com.zlk.service.impl.PropertyUserService;
import com.zlk.utils.MyUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
@Controller
public class AverageUserControl {
    @Resource
    private IAverageUserService averageUserService;
    @Resource
    private IHistoryService historyService;
    @Resource
    private IMassageService massageService;
    @Resource
    private ICollectionService collectionService;

    @RequestMapping("/into_Average1")
    public ModelAndView Into1(AverageUserBean userInfoB){
        ModelAndView mav = new ModelAndView();
        String s="login_Average";
        mav.setViewName(s);
        return mav;
    }
    @RequestMapping("/into_Average2")
    public ModelAndView Into2(AverageUserBean userInfoB){
        ModelAndView mav = new ModelAndView();
        String s="average_sign_up";
        mav.setViewName(s);
        return mav;
    }
    /*
 映射关系：要求实体类的属性名和前台页面的表单控件的name属性值一一对应
 课堂作业：
     如果使用 @RequestParam 对方法参数进行绑定，是否可行？
  */
    @RequestMapping("/login_Average")
    public ModelAndView doLogin_Average(AverageUserBean userInfoB) {
        System.out.println("basepath:" + System.getProperty("server.basePath"));
        // 返回的视图对象
        ModelAndView mav = new ModelAndView();
        // 设置modelandview要显示的页面名:默认进入登录成功页面
        mav.setViewName("main");
        if (userInfoB != null) {
            System.out.println("后台登录处理：" + userInfoB.getaName() + ":" + userInfoB.getaPwd());
        } else {
            System.out.println("后台登录：null");
        }
        // 调用service的接口方法，进行登录的业务逻辑处理
        List<AverageUserBean> lstUserInfos = averageUserService.doLogin(userInfoB);

        // 登录判定
        if (lstUserInfos != null && lstUserInfos.size() > 0) {
            // 登录成功，缓存当前登录成功的数据
            mav.addObject("loginedAid", lstUserInfos.get(0).getaId());
            mav.addObject("loginedname", lstUserInfos.get(0).getaName());
            mav.addObject("loginedApwd", lstUserInfos.get(0).getaPwd());
            mav.addObject("loginedAimg", lstUserInfos.get(0).getaImg());
            mav.addObject("loginedAphone", lstUserInfos.get(0).getaPhone());
            mav.addObject("loginedAemil", lstUserInfos.get(0).getaEmil());
            mav.addObject("loginedAadd", lstUserInfos.get(0).getaAddress());

        } else {
            // 登录不成功
            System.out.println("登录失败");
            // 返回登录页面
            //mav.setViewName("../../login");  /// 注意：springmvc进行视图解析时，不会处理 ../ ,而是直接拼接字符串
            mav.addObject("error_login", "1");
            mav.setViewName("login_Average");
            // 使用字符串方式作为响应函数的返回值

        }

        // 返回ModelAndView对象
        return mav;
    }
    /**
     * 保存用户信息
     *
     * @param userInfoB 用户参数实体类
     * @param file_aImg 用于接收客户端发送的流文件对象
     * @return 结果视图
     */

    @RequestMapping("/saveAverageUser")
    public ModelAndView saveOrUpdateUserInfo(AverageUserBean userInfoB,@RequestParam("file_aImg") MultipartFile file_aImg) {
        // 调用工具类的文件上传方法
        MyUtils.uploadSingleFile(file_aImg, userInfoB, "uploadfiles/userimgfiles/", "userimg");

        List<AverageUserBean> UserInfos = averageUserService.doLogin(userInfoB);

        ModelAndView mav = new ModelAndView();

        //重复判定问题****************
        if(UserInfos!=null&&UserInfos.size()>0){

            System.out.println("添加失败！");
            //return "userInfoManager/userInfoAdd";
            mav.addObject("error_sign","1");
            mav.setViewName("average_sign_up");
            return mav;
        }else {
            // 调用Service层进行用户信息数据保存和修改操作
            int i = averageUserService.saveOrUpdateUserInfo(userInfoB);
            // 根据操作结果进行视图转发处理
            mav.setViewName("login_Average");
            return mav;
        }
    }


    @RequestMapping("/updateAverageUser")
    public String saveOrUpdateUserInfo2(AverageUserBean averageUserBean,@RequestParam("file_aImg") MultipartFile file_aImg) {
        // 调用工具类的文件上传方法
        MyUtils.uploadSingleFile(file_aImg, averageUserBean, "uploadfiles/userimgfiles/", "userimg");
        if(averageUserBean.getaId()==null){
            //跳转到修改失败界面
            System.out.println("操作失败！");
            return "userInfoManager/averageUpdate";
        }else{
            AverageUserBean ave=updateAllaName(averageUserBean);
            // 调用Service层进行用户信息数据保存和修改操作
            int i = averageUserService.saveOrUpdateUserInfo(ave);
            // 根据操作结果进行视图转发处理
            return "closeMainProperty";
        }


    }

    /**
     * ajax进行数据查询处理
     *
     * @param averageUserBean 查询参数信息
     * @return 查询结果集
     */
    @ResponseBody
    @RequestMapping("/doAjaxAverageUserQueryByParams")
    public List<AverageUserBean> doAjaxAverageUserQueryByParams(AverageUserBean averageUserBean) {

        // 调用service层经进行数据库查询操作
        List<AverageUserBean> lstUserInfos = averageUserService.selectUserInfoByParams(averageUserBean);
        // 在springmvc中直接放回数据结构，springmvc会自动把数据结果集转换为 json数据串发给客户端
        // 如果不是springmvc框架，则需要使用手动或者第三方工具将结果集转换为json字符串发回给客户端
        return lstUserInfos;

    }

    /**
     * 使用ajax进行删除操作
     *
     * @param aId 删除记录的主键id字段值
     * @return 删除操作的结果记录
     */
    @ResponseBody
    @RequestMapping("/doAjaxAverageUserDeleteByID")
    public int doAjaxAverageByParams2(Integer aId) {
        // 默认返回值
        int i = 0;
        // 调用service层进行删除操作
        i = averageUserService.deleteUserInfoByID(aId);
        return i;
    }
    //修改所有用户名字段的方法，加图片验证修改
    public AverageUserBean updateAllaName(AverageUserBean ave){
        //用户姓名修改同时，修改所属的所有商品信息里面的用户名
        AverageUserBean a=new AverageUserBean();
        List<AverageUserBean> user = averageUserService.selectByAid(ave);
        a=user.get(0);

        //修改订单中的aName
        HistoryBean his=new HistoryBean();
        his.setaName(a.getaName());
        List<HistoryBean> handList3=historyService.selectForA(his);
        if(handList3!=null&&handList3.size()>0){
            for (HistoryBean hi:handList3) {
                hi.setaName(ave.getaName());
                historyService.saveOrUpdateUserInfo(hi);
            }
        }
        //修改留言中的字段
        MassageBean mes=new MassageBean();
        mes.setpName(a.getaName());
        List<MassageBean> handList4=massageService.selectByP(mes);
        if(handList4!=null&&handList4.size()>0){
            for (MassageBean m:handList4) {
                m.setpName(ave.getaName());
                massageService.saveOrUpdateUserInfo(m);
            }
        }
        MassageBean me=new MassageBean();
        me.setaName(a.getaName());
        List<MassageBean> handList5=massageService.selectByA(me);
        if(handList5!=null&&handList5.size()>0){
            for (MassageBean m:handList5) {
                m.setaName(ave.getaName());
                massageService.saveOrUpdateUserInfo(m);
            }
        }
        //收藏
        CollectionBean co=new CollectionBean();
        co.setaName(a.getaName());
        List<CollectionBean> handList6=collectionService.selectByA(co);
        if(handList6!=null&&handList6.size()>0){
            for (CollectionBean c:handList6){
                c.setaName(ave.getaName());
                collectionService.saveOrUpdateUserInfo(c);
            }
        }

        //.octet-stream不保存在数据库
        String yanzheng=ave.getaImg().substring(ave.getaImg().lastIndexOf("."));
        System.out.println(yanzheng);
        if(yanzheng.equals(".octet-stream")){
            ave.setaImg(a.getaImg());
        }
        return ave;
    }
}
