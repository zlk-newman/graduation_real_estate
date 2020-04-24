package com.zlk.control;

import com.zlk.bean.*;
import com.zlk.service.ICollectionService;
import com.zlk.service.IHandRoomService;
import com.zlk.service.IHistoryService;
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
public class HandRoomControl {
    @Resource
    private IHandRoomService handRoomService;
    @Resource
    private IHistoryService historyService;
    @Resource
    private ICollectionService collectionService;
    //查询全部二手房
    @ResponseBody
    @RequestMapping("/selectHandRoomFor")
    public List<HandRoomBean> SelectAllHandRoom(HandRoomBean h){
        List<HandRoomBean> handRoomLists=handRoomService.select(h);

            return handRoomLists;

    }
    //模糊查询二手房
    @ResponseBody
    @RequestMapping("/selectHandByParam")
    public List<HandRoomBean> SelectByParam(HandRoomBean h){
        //前端做选择页面决定模糊查询的字段
        List<HandRoomBean> handByParam=handRoomService.selectByParams(h);
            return handByParam;

    }
    //模糊查询二手房
    @ResponseBody
    @RequestMapping("/selectHandByParamForA")
    public List<HandRoomBean> SelectByParamForA(HandRoomBean h){
        //前端做选择页面决定模糊查询的字段
        List<HandRoomBean> handByParam=handRoomService.selectByParamsForA(h);
        return handByParam;

    }
    //查看单个二手房商品的数据
    @RequestMapping("/selectHandOne")
    public ModelAndView SelectHandOne(HandRoomBean h){
        ModelAndView mav = new ModelAndView();
        List<HandRoomBean> one=handRoomService.selectOne(h);
        if(one!=null&&one.size()>0){
            HandRoomBean handOne;
            handOne = one.get(0);
            mav.addObject("HandRoomName",handOne.getHandName());
            mav.addObject("HandRoomPname",handOne.getpName());
            mav.addObject("HandRoomAge",handOne.getHandAge());
            mav.addObject("HandRoomAdd",handOne.getHandAddress());
            mav.addObject("HandRoomImg",handOne.getHandImg());
            mav.addObject("HandRoomNum",handOne.getHandNumber());
            mav.addObject("HandRoomPrice",handOne.getHandPrice());
            mav.addObject("HandRoomDes",handOne.getHandDescribe());
            mav.addObject("HandRoomColnum",handOne.getHandColnum());
            mav.setViewName("userInfoManager/HandRoomDisplay");
            return mav;
        }else{
            //下面响应前端error，并跳回添加页面重新添加
            mav.addObject("error_sign","1");
            mav.setViewName("userInfoManager/collectionSelectForA");
            return mav;
        }
    }
    //新增
    @RequestMapping("/saveHand")
    public ModelAndView SaveHand(HandRoomBean h, @RequestParam("file_handImg") MultipartFile file_aImg) {
        // 调用工具类的文件上传方法
        MyUtils.uploadSingleFile(file_aImg, h, "uploadfiles/userimgfiles/", "handimg");

        List<HandRoomBean> one = handRoomService.selectOne(h);

        ModelAndView mav = new ModelAndView();

        //重复判定问题****************
        if(one!=null&&one.size()>0){

            System.out.println("添加失败！");
            //return "userInfoManager/userInfoAdd";
            //下面响应前端error，并跳回添加页面重新添加
            mav.addObject("error_sign","1");
            mav.setViewName("productInfoManager/InsertHandRoom");
            return mav;
        }else {

            // 调用Service层进行数据保存和修改操作
            int i = handRoomService.saveOrUpdateUserInfo(h);
            // 显示添加成功跳回添加前界面
            mav.setViewName("productInfoManager/productInfoAddDetail");
            return mav;
        }
    }
    //修改
    @RequestMapping("/updateHandRoom")
    public String UpdateHandRoom(HandRoomBean h,@RequestParam("file_handImg") MultipartFile file_aImg) {
        // 调用工具类的文件上传方法
        MyUtils.uploadSingleFile(file_aImg, h, "uploadfiles/userimgfiles/", "handimg");

        if(h.getHandId()==null){
            //跳转到修改失败界面
            System.out.println("操作失败！");
            return "productInfoManager/HandRoomModify";
        }else{
            HandRoomBean hand=new HandRoomBean();
            List<HandRoomBean> hlist=handRoomService.selectById(h);
            hand=hlist.get(0);
            //修改订单名、商品图片
            HistoryBean his=new HistoryBean();
            his.setHouseName(hand.getHandName());
            List<HistoryBean> hisList=historyService.selectByHouseName(his);
            if(hisList!=null&&hisList.size()>0){
                for(HistoryBean hi:hisList){
                    hi.setHouseName(h.getHandName());
                    hi.setHouseImg(h.getHandImg());
                    historyService.saveOrUpdateUserInfo(hi);
                }
            }
            //修改收藏的商品名、商品图片
            CollectionBean col=new CollectionBean();
            col.setColName(hand.getHandName());
            List<CollectionBean> colList=collectionService.selectByParams(col);
            if(colList!=null&&colList.size()>0){
                for(CollectionBean co:colList){
                    co.setColName(h.getHandName());
                    co.setColImg(h.getHandImg());
                    collectionService.saveOrUpdateUserInfo(co);
                }
            }
            //.octet-stream不保存在数据库
            String yanzheng= h.getHandImg().substring(h.getHandImg().lastIndexOf("."));
            System.out.println(yanzheng);
            if(yanzheng.equals(".octet-stream")){
                List<HandRoomBean> infos = handRoomService.selectById(h);
                HandRoomBean handIn=new HandRoomBean();
                handIn=infos.get(0);
                h.setHandImg(handIn.getHandImg());
            }
            // 调用Service层进行用户信息数据保存和修改操作
            int i = handRoomService.saveOrUpdateUserInfo(h);
            // 根据操作结果进行视图转发处理
            return "productInfoManager/productInfoAddDetail";
        }


    }

    /**
     * 使用ajax进行删除操作
     *
     * @param handId 删除记录的主键id字段值
     * @return 删除操作的结果记录
     */
    @ResponseBody
    @RequestMapping("/deleteHandRoomByID")
    public int DeleteHandRoomByID(Integer handId) {
        HandRoomBean hand=new HandRoomBean();
        hand.setHandId(handId);
        List<HandRoomBean> hlist=handRoomService.selectOne(hand);
        hand=hlist.get(0);
        //删除相关订单
        HistoryBean his=new HistoryBean();
        his.setHouseName(hand.getHandName());
        List<HistoryBean> hisList=historyService.selectByHouseName(his);
        if(hisList!=null&&hisList.size()>0){
            for(HistoryBean hi:hisList){
                historyService.deleteUserInfoByID(hi.gethId());
            }
        }
        //删除相关收藏
        CollectionBean col=new CollectionBean();
        col.setColName(hand.getHandName());
        List<CollectionBean> colList=collectionService.selectByParams(col);
        if(colList!=null&&colList.size()>0){
            for(CollectionBean co:colList){
                collectionService.deleteUserInfoByID(co.getColId());
            }
        }
        // 默认返回值
        int i = 0;
        // 调用service层进行删除操作
        i = handRoomService.deleteUserInfoByID(handId);
        return i;
    }
}
