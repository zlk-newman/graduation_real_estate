package com.zlk.control;

import com.zlk.bean.CommodityHouseBean;
import com.zlk.bean.HandRoomBean;
import com.zlk.bean.HistoryBean;
import com.zlk.service.ICommodityHouseService;
import com.zlk.service.IHandRoomService;
import com.zlk.service.IHistoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class OrderControl {
    @Resource
    private IHistoryService historyService;
    @Resource
    private IHandRoomService handRoomService;
    @Resource
    private ICommodityHouseService commodityHouseService;
    //新增（二手房交易）
    @RequestMapping("/saveHandHistory")
    public ModelAndView SaveHandHistory(HistoryBean h) {
        HandRoomBean one=new HandRoomBean();

        ModelAndView mav = new ModelAndView();
        one.setHandName(h.getHouseName());
        List<HandRoomBean> handList=handRoomService.selectOne(one);
        one=handList.get(0);
        //重复判定问题****************
        if(one.getHandNumber()<=0){
            System.out.println("数量不足！");
            //return "userInfoManager/userInfoAdd";
            //下面响应前端error，并跳回添加页面重新添加
            mav.addObject("error_sign","1");
            mav.setViewName("orderInfoManager/orderedNo");

        }else{
            // 调用Service层进行数据保存和修改操作
            int i = historyService.saveOrUpdateUserInfo(h);
            //生成订单的同时，该地产数量-1
            one.setHandNumber(one.getHandNumber()-1);
            handRoomService.saveOrUpdateUserInfo(one);
            // 显示添加成功跳回添加前界面
            mav.setViewName("orderInfoManager/orderedSuccessed");
        }
        return mav;
    }
    //新增(商品房交易)
    @RequestMapping("/saveComHistory")
    public ModelAndView SaveComHistory(HistoryBean h) {
        CommodityHouseBean one=new CommodityHouseBean();
        ModelAndView mav = new ModelAndView();
        one.setComName(h.getHouseName());
        List<CommodityHouseBean> comList=commodityHouseService.selectOne(one);
        one=comList.get(0);
        //重复判定问题****************
        if(one.getComNumber()<=0){

            System.out.println("添加订单失败！");
            //return "userInfoManager/userInfoAdd";
            //下面响应前端error，并跳回添加页面重新添加
            mav.addObject("error_sign","1");
            mav.setViewName("orderInfoManager/orderedNo");
            return mav;
        }else {
            // 调用Service层进行数据保存和修改操作
            int i = historyService.saveOrUpdateUserInfo(h);
            //生成订单的同时，该地产数量-1

            one.setComNumber(one.getComNumber()-1);
            commodityHouseService.saveOrUpdateUserInfo(one);
            // 显示添加成功跳回添加前界面
            mav.setViewName("orderInfoManager/orderedSuccessed");
            return mav;
        }
    }
    //查看
    //查询全部历史订单（用户）
    @ResponseBody
    @RequestMapping("/selectAllHistoryForA")
    public List<HistoryBean> selectAllHistoryForA(HistoryBean h){
        //前端用historyName隐藏的form
        List<HistoryBean> lists=historyService.selectForA(h);
        if(lists!=null&&lists.size()>0){
            return lists;
        }else{
            return null;
        }
    }
    //查看
    //查询全部历史订单（客户）
    @ResponseBody
    @RequestMapping("/selectAllHistoryForP")
    public List<HistoryBean> selectAllHistoryForP(HistoryBean h){

        List<HistoryBean> lists=historyService.selectForP(h);
        if(lists!=null&&lists.size()>0){
            return lists;
        }else{
            return null;
        }
    }

    /**
     * 使用ajax进行删除操作
     *
     * @param hId 删除记录的主键id字段值
     * @return 删除操作的结果记录
     */
    @ResponseBody
    @RequestMapping("/deleteHistoryByID1")
    public int DeleteHistoryByID1(Integer hId) {
        HistoryBean his=new HistoryBean();
        his.sethId(hId);
        List<HistoryBean> list=historyService.selectByName(his);
        his=list.get(0);
        //二手房订单取消
        HandRoomBean hand=new HandRoomBean();
        hand.setHandName(his.getHouseName());
        List<HandRoomBean> list2=handRoomService.selectOne(hand);
        if(list2!=null&&list2.size()>0){
            hand=list2.get(0);
            int n=hand.getHandNumber();
            hand.setHandNumber(n+1);
            handRoomService.saveOrUpdateUserInfo(hand);
        }
        //商品房取消订单
        CommodityHouseBean com=new CommodityHouseBean();
        com.setComName(his.getHouseName());
        List<CommodityHouseBean> list3=commodityHouseService.selectOne(com);
        if(list3!=null&&list3.size()>0){
            com=list3.get(0);
            int m=com.getComNumber();
            com.setComNumber(m+1);
            commodityHouseService.saveOrUpdateUserInfo(com);
        }
        // 默认返回值
        int i = 0;
        // 调用service层进行删除操作
        i = historyService.deleteUserInfoByID(hId);
        return i;
    }
    @ResponseBody
    @RequestMapping("/deleteHistoryByID2")
    public int DeleteHistoryByID2(Integer hId) {
        // 默认返回值
        int i = 0;
        // 调用service层进行删除操作
        i = historyService.deleteUserInfoByID(hId);
        return i;
    }

}
