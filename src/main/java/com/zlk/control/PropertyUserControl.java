package com.zlk.control;

import com.zlk.bean.*;
import com.zlk.service.*;
import com.zlk.utils.MyUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class PropertyUserControl {
    @Resource
    private IPropertyUserService PropertyUserService;
    @Resource
    private IHandRoomService handRoomService;
    @Resource
    private ICommodityHouseService commodityHouseService;
    @Resource
    private IHistoryService historyService;
    @Resource
    private IMassageService massageService;

    @RequestMapping("/into_Property1")
    public ModelAndView Into1(PropertyUserBean userInfoB){
        ModelAndView mav = new ModelAndView();
        String s="login_Property";
        mav.setViewName(s);
        return mav;
    }


    @RequestMapping("/login_Property")
    public ModelAndView doLogin_Property(PropertyUserBean userInfoB) {
        System.out.println("basepath:" + System.getProperty("server.basePath"));
        // 返回的视图对象
        ModelAndView mav = new ModelAndView();
        // 设置modelandview要显示的页面名:默认进入登录成功页面
        mav.setViewName("main_Property");
        if (userInfoB != null) {
            System.out.println("后台登录处理：" + userInfoB.getpName() + ":" + userInfoB.getpPwd());
        } else {
            System.out.println("后台登录：null");
        }
        // 调用service的接口方法，进行登录的业务逻辑处理
        List<PropertyUserBean> lstUserInfos = PropertyUserService.doLogin(userInfoB);

        // 登录判定
        if (lstUserInfos != null && lstUserInfos.size() > 0) {
            // 登录成功，缓存当前登录成功的数据
            mav.addObject("loginedPid", lstUserInfos.get(0).getpId());
            mav.addObject("loginedname", lstUserInfos.get(0).getpName());
            mav.addObject("loginedPpwd", lstUserInfos.get(0).getpPwd());
            mav.addObject("loginedPimg", lstUserInfos.get(0).getpImg());
            mav.addObject("loginedPphone", lstUserInfos.get(0).getpPhone());
            mav.addObject("loginedPemil", lstUserInfos.get(0).getpEmil());
            mav.addObject("loginedPcom", lstUserInfos.get(0).getpCompany());
            mav.addObject("loginedPadd", lstUserInfos.get(0).getpAddress());
        } else {
            // 登录不成功
            System.out.println("登录失败");
            // 返回登录页面
            //mav.setViewName("../../login");  /// 注意：springmvc进行视图解析时，不会处理 ../ ,而是直接拼接字符串
            mav.addObject("error_login", "1");
            mav.setViewName("login_Property");
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

    @RequestMapping("/savePropertyUser")
    public ModelAndView saveOrUpdateUserInfo(PropertyUserBean userInfoB,@RequestParam("file_pImg") MultipartFile file_aImg) {
        // 调用工具类的文件上传方法
        MyUtils.uploadSingleFile(file_aImg, userInfoB, "uploadfiles/userimgfiles/", "userimg");

        List<PropertyUserBean> UserInfos = PropertyUserService.doLogin(userInfoB);

        ModelAndView mav = new ModelAndView();

        //重复判定问题****************
        if(UserInfos!=null&&UserInfos.size()>0){

            System.out.println("添加失败！");
            //return "userInfoManager/userInfoAdd";
            mav.addObject("error_sign","1");
            mav.setViewName("supplierInfoManager/property_sign_up");
            return mav;
        }else {
            // 调用Service层进行用户信息数据保存和修改操作
            int i = PropertyUserService.saveOrUpdateUserInfo(userInfoB);
            // 根据操作结果进行视图转发处理
            mav.setViewName("supplierInfoManager/supplierInfoAddDetail");
            return mav;
        }
    }


    @RequestMapping("/updatePropertyUser1")
    public String saveOrUpdateUserInfo1(PropertyUserBean PropertyUserBean,@RequestParam("file_pImg") MultipartFile file_aImg) {
        MyUtils.uploadSingleFile(file_aImg, PropertyUserBean, "uploadfiles/userimgfiles/", "userimg");

        if(PropertyUserBean.getpId()==null){
            //跳转到修改失败界面
            System.out.println("操作失败！");
            return "supplierInfoManager/supplierNo";
        }else {
             //调用修改方法
            PropertyUserBean pro=updateAllpName(PropertyUserBean);

            //调用Service层进行用户信息数据保存和修改操作
            int i = PropertyUserService.saveOrUpdateUserInfo(pro);
            //根据操作结果进行视图转发处理
            return "supplierInfoManager/supplierInfoAddDetail";
        }



    }
    @RequestMapping("/updatePropertyUser2")
    public String saveOrUpdateUserInfo2(PropertyUserBean PropertyUserBean,@RequestParam("file_pImg") MultipartFile file_aImg) {
        MyUtils.uploadSingleFile(file_aImg, PropertyUserBean, "uploadfiles/userimgfiles/", "userimg");
        if(PropertyUserBean.getpId()==null){
            //跳转到修改失败界面
            System.out.println("修改失败！");
            return "supplierInfoManager/supplierInfoModifyForP";
        }else{
            //调用修改方法
            PropertyUserBean pro=updateAllpName(PropertyUserBean);

            //调用Service层进行用户信息数据保存和修改操作
            int i = PropertyUserService.saveOrUpdateUserInfo(pro);
            //根据操作结果进行视图转发处理
            return "closeMainProperty";
        }



    }
    /**
     * ajax进行数据查询处理
     *
     * @param PropertyUserBean 查询参数信息
     * @return 查询结果集
     */
    @ResponseBody
    @RequestMapping("/doAjaxPropertyUserQueryByParams")
    public List<PropertyUserBean> doAjaxPropertyUserQueryByParams(PropertyUserBean PropertyUserBean) {

        // 调用service层经进行数据库查询操作
        List<PropertyUserBean> lstUserInfos = PropertyUserService.selectUserInfoByParams(PropertyUserBean);
        // 在springmvc中直接放回数据结构，springmvc会自动把数据结果集转换为 json数据串发给客户端
        // 如果不是springmvc框架，则需要使用手动或者第三方工具将结果集转换为json字符串发回给客户端
        return lstUserInfos;

    }

    /**
     * 使用ajax进行删除操作
     *
     * @param pId 删除记录的主键id字段值
     * @return 删除操作的结果记录
     */
    @ResponseBody
    @RequestMapping("/doAjaxPropertyUserDeleteByID")
    public int doAjaxPropertyByParams2(Integer pId) {
        PropertyUserBean p=new PropertyUserBean();
        p.setpId(pId);
        List<PropertyUserBean> user = PropertyUserService.selectByPid(p);
        p=user.get(0);
        //删除该客户的二手房
        HandRoomBean h=new HandRoomBean();
        h.setpName(p.getpName());
        List<HandRoomBean> handList1=handRoomService.select(h);
        if(handList1!=null&&handList1.size()>0){
            for (HandRoomBean hand:handList1) {
                handRoomService.deleteUserInfoByID(hand.getHandId());
            }
        }
        //删除该客户的商品房
        CommodityHouseBean c=new CommodityHouseBean();
        c.setpName(p.getpName());
        List<CommodityHouseBean> handList2=commodityHouseService.select(c);
        if(handList2!=null&&handList2.size()>0){
            for (CommodityHouseBean com:handList2) {
                commodityHouseService.deleteUserInfoByID(com.getComId());
            }
        }
        //删除相关订单
        HistoryBean his=new HistoryBean();
        his.setpName(p.getpName());
        List<HistoryBean> handList3=historyService.selectForP(his);
        if(handList3!=null&&handList3.size()>0){
            for (HistoryBean hi:handList3) {
                historyService.deleteUserInfoByID(hi.gethId());
            }
        }
        //删除相关留言
        MassageBean mes=new MassageBean();
        mes.setpName(p.getpName());
        List<MassageBean> handList4=massageService.selectByP(mes);
        if(handList4!=null&&handList4.size()>0){
            for (MassageBean m:handList4) {
                massageService.deleteUserInfoByID(m.getMasId());
            }
        }
        MassageBean me=new MassageBean();
        me.setaName(p.getpName());
        List<MassageBean> handList5=massageService.selectByA(me);
        if(handList5!=null&&handList5.size()>0){
            for (MassageBean m:handList5) {
                massageService.deleteUserInfoByID(m.getMasId());
            }
        }
        // 默认返回值
        int i = 0;
        // 调用service层进行删除操作
        i = PropertyUserService.deleteUserInfoByID(pId);
        return i;
    }

    //修改所有客户名字段的方法，加图片验证修改
    public PropertyUserBean updateAllpName(PropertyUserBean PropertyUserBean){
        //用户姓名修改同时，修改所属的所有商品信息里面的用户名
        PropertyUserBean p=new PropertyUserBean();
        List<PropertyUserBean> user = PropertyUserService.selectByPid(PropertyUserBean);
        p=user.get(0);
        //修改二手房类中的pName
        HandRoomBean h=new HandRoomBean();
        h.setpName(p.getpName());
        List<HandRoomBean> handList1=handRoomService.select(h);
        if(handList1!=null&&handList1.size()>0){
            for (HandRoomBean hand:handList1) {
                hand.setpName(PropertyUserBean.getpName());
                handRoomService.saveOrUpdateUserInfo(hand);
            }
        }
        //修改商品房类中的pName
        CommodityHouseBean c=new CommodityHouseBean();
        c.setpName(p.getpName());
        List<CommodityHouseBean> handList2=commodityHouseService.select(c);
        if(handList2!=null&&handList2.size()>0){
            for (CommodityHouseBean com:handList2) {
                com.setpName(PropertyUserBean.getpName());
                commodityHouseService.saveOrUpdateUserInfo(com);
            }
        }
        //修改订单中的pName
        HistoryBean his=new HistoryBean();
        his.setpName(p.getpName());
        List<HistoryBean> handList3=historyService.selectForP(his);
        if(handList3!=null&&handList3.size()>0){
            for (HistoryBean hi:handList3) {
                hi.setpName(PropertyUserBean.getpName());
                historyService.saveOrUpdateUserInfo(hi);
            }
        }
        //修改留言中的字段
        MassageBean mes=new MassageBean();
        mes.setpName(p.getpName());
        List<MassageBean> handList4=massageService.selectByP(mes);
        if(handList4!=null&&handList4.size()>0){
            for (MassageBean m:handList4) {
                m.setpName(PropertyUserBean.getpName());
                massageService.saveOrUpdateUserInfo(m);
            }
        }
        MassageBean me=new MassageBean();
        me.setaName(p.getpName());
        List<MassageBean> handList5=massageService.selectByA(me);
        if(handList5!=null&&handList5.size()>0){
            for (MassageBean m:handList5) {
                m.setaName(PropertyUserBean.getpName());
                massageService.saveOrUpdateUserInfo(m);
            }
        }
        //.octet-stream不保存在数据库
        String yanzheng=PropertyUserBean.getpImg().substring(PropertyUserBean.getpImg().lastIndexOf("."));
        System.out.println(yanzheng);
        if(yanzheng.equals(".octet-stream")){
            PropertyUserBean.setpImg(p.getpImg());
        }
        return PropertyUserBean;
    }

}
