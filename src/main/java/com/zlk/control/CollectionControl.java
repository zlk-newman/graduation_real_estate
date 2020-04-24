package com.zlk.control;

import com.zlk.bean.CollectionBean;
import com.zlk.bean.CommodityHouseBean;
import com.zlk.bean.HandRoomBean;
import com.zlk.bean.HistoryBean;
import com.zlk.service.ICollectionService;
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
public class CollectionControl {
    @Resource
    private ICollectionService collectionService;
    @Resource
    private IHandRoomService handRoomService;
    @Resource
    private ICommodityHouseService commodityHouseService;
    //新增（二手房收藏）
    @RequestMapping("/saveHandCollection")
    public ModelAndView SaveHandCollection(CollectionBean c) {
        HandRoomBean one=new HandRoomBean();
        c.setColName("Hand."+c.getColName());
        List<CollectionBean> colList=collectionService.selectByParams(c);
        ModelAndView mav = new ModelAndView();

        //重复判定问题****************
        if(colList!=null&&colList.size()>0){

            System.out.println("添加失败！");
            //return "userInfoManager/userInfoAdd";
            //下面响应前端error，并跳回添加页面重新添加
            mav.setViewName("productInfoManager/collectedNo");
            return mav;
        }else {
            // 调用Service层进行数据保存和修改操作
            int i = collectionService.saveOrUpdateUserInfo(c);
            //生成收藏的同时，该收藏数量+1
            one.setHandName(c.getColName().substring(5));
            List<HandRoomBean> handList=handRoomService.selectOne(one);
            one=handList.get(0);
            one.setHandColnum(one.getHandColnum()+1);
            handRoomService.saveOrUpdateUserInfo(one);
            // 显示添加成功跳回添加前界面
            mav.setViewName("productInfoManager/collectedSuccessed");
            return mav;
        }
    }
    //新增(商品房收藏)
    @RequestMapping("/saveComCollection")
    public ModelAndView SaveComCollection(CollectionBean c) {
        CommodityHouseBean one=new CommodityHouseBean();
        c.setColName("Comm."+c.getColName());
        List<CollectionBean> colList=collectionService.selectByParams(c);
        ModelAndView mav = new ModelAndView();

        //重复判定问题****************
        if(colList!=null&&colList.size()>0){

            System.out.println("添加失败！");
            //return "userInfoManager/userInfoAdd";
            //下面响应前端error，并跳回添加页面重新添加
            mav.addObject("error_sign","1");
            mav.setViewName("productInfoManager/collectedNo");
            return mav;
        }else {
            // 调用Service层进行数据保存和修改操作
            int i = collectionService.saveOrUpdateUserInfo(c);
            //生成订单的同时，该地产数量-1
            one.setComName(c.getColName().substring(5));
            List<CommodityHouseBean> comList=commodityHouseService.selectOne(one);
            one=comList.get(0);
            one.setComColnum(one.getComColnum()+1);
            commodityHouseService.saveOrUpdateUserInfo(one);
            // 显示添加成功跳回添加前界面
            mav.setViewName("productInfoManager/collectedSuccessed");
            return mav;
        }
    }
    //查看
    //查询全部收藏（用户）
    @ResponseBody
    @RequestMapping("/selectAllCollection")
    public List<CollectionBean> selectAllCollection(CollectionBean c){
        //前端用colName隐藏的form
        List<CollectionBean> lists=collectionService.selectByA(c);
        if(lists!=null&&lists.size()>0){
            return lists;
        }else{
            return null;
        }
    }
    /**
     * 使用ajax进行删除操作
     *
     * @param colId 删除记录的主键id字段值
     * @return 删除操作的结果记录
     */
    @ResponseBody
    @RequestMapping("/deleteCollectionByID")
    public int DeleteCollectionByID(Integer colId) {
        CollectionBean col=new CollectionBean();
        col.setColId(colId);
        List<CollectionBean> colList=collectionService.selectById(col);
        col=colList.get(0);
        //二手房取消收藏
        HandRoomBean hand=new HandRoomBean();
        hand.setHandName(col.getColName().substring(5));
        List<HandRoomBean> list2=handRoomService.selectOne(hand);
        if(list2!=null&&list2.size()>0){
            hand=list2.get(0);
            int n=hand.getHandColnum();
            if(n>0){
                hand.setHandColnum(n-1);
                handRoomService.saveOrUpdateUserInfo(hand);
            }
        }
        //商品房取消订单
        CommodityHouseBean com=new CommodityHouseBean();
        com.setComName(col.getColName().substring(5));
        List<CommodityHouseBean> list3=commodityHouseService.selectOne(com);
        if(list3!=null&&list3.size()>0){
            com=list3.get(0);
            int m=com.getComColnum();
            if(m>0){
                com.setComColnum(m-1);
                commodityHouseService.saveOrUpdateUserInfo(com);
            }
        }
        // 默认返回值
        int i = 0;
        // 调用service层进行删除操作
        i = collectionService.deleteUserInfoByID(colId);
        return i;
    }

}
