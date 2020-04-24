package com.zlk.control;

import com.zlk.bean.CollectionBean;
import com.zlk.bean.CommodityHouseBean;
import com.zlk.bean.HandRoomBean;
import com.zlk.bean.HistoryBean;
import com.zlk.service.ICollectionService;
import com.zlk.service.ICommodityHouseService;
import com.zlk.service.IHistoryService;
import com.zlk.service.impl.CommodityHouseService;
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
public class CommodityHouseControl {
    @Resource
    private ICommodityHouseService commodityHouseService;
    @Resource
    private IHistoryService historyService;
    @Resource
    private ICollectionService collectionService;
    //模糊查询二手房
    @ResponseBody
    @RequestMapping("/selectComByParam")
    public List<CommodityHouseBean> SelectByParam(CommodityHouseBean c){
        //前端做选择页面决定模糊查询的字段
        List<CommodityHouseBean> comByParam=commodityHouseService.selectByParams(c);
            return comByParam;
    }
    //模糊查询二手房
    @ResponseBody
    @RequestMapping("/selectComByParamForA")
    public List<CommodityHouseBean> SelectByParamForA(CommodityHouseBean c){
        //前端做选择页面决定模糊查询的字段
        List<CommodityHouseBean> comByParam=commodityHouseService.selectByParamsForA(c);
        return comByParam;
    }
    //查看单个二手房商品的数据
    @ResponseBody
    @RequestMapping("/selectComOne")
    public ModelAndView SelectComOne(CommodityHouseBean c){
        ModelAndView mav = new ModelAndView();
        List<CommodityHouseBean> one=commodityHouseService.selectOne(c);
        if(one!=null&&one.size()>0){
            CommodityHouseBean handOne;
            handOne = one.get(0);
            mav.addObject("CommodityHouseId",handOne.getComId());
            mav.addObject("CommodityHouseName",handOne.getComName());
            mav.addObject("CommodityHousePname",handOne.getpName());
            mav.addObject("CommodityHouseAdd",handOne.getComAddress());
            mav.addObject("CommodityHouseImg",handOne.getComImg());
            mav.addObject("CommodityHouseNum",handOne.getComNumber());
            mav.addObject("CommodityHousePrice",handOne.getComPrice());
            mav.addObject("CommodityHouseDes",handOne.getComDescribe());
            mav.addObject("CommodityHouseColnum",handOne.getComColnum());
            mav.setViewName("userInfoManager/ComRoomDisplay");
            return mav;
        }else{
            //下面响应前端error，并跳回添加页面重新添加
            mav.addObject("error_sign","1");
            mav.setViewName("userInfoManager/collectionSelectForA");
            return mav;
        }
    }
    //新增
    @RequestMapping("/saveCom")
    public ModelAndView SaveCom(CommodityHouseBean c, @RequestParam("file_comImg") MultipartFile file_aImg) {
        // 调用工具类的文件上传方法
        MyUtils.uploadSingleFile(file_aImg, c, "uploadfiles/userimgfiles/", "comimg");

        List<CommodityHouseBean> oneCom = commodityHouseService.selectOne(c);

        ModelAndView mav = new ModelAndView();

        //重复判定问题****************
        if(oneCom!=null&&oneCom.size()>0){

            System.out.println("添加失败！");
            //return "userInfoManager/userInfoAdd";
            //下面响应前端error，并跳回添加页面重新添加
            mav.addObject("error_sign","1");
            mav.setViewName("productInfoManager/InsertComRoom");
            return mav;
        }else {
            // 调用Service层进行数据保存和修改操作
            int i = commodityHouseService.saveOrUpdateUserInfo(c);
            // 显示添加成功跳回添加前界面
            mav.setViewName("productInfoManager/productInfoAddDetail");
            return mav;
        }
    }
    //修改
    @RequestMapping("/updateCommodityHouse")
    public String UpdateCommodityHouse(CommodityHouseBean c,@RequestParam("file_comImg") MultipartFile file_aImg) {
        // 调用工具类的文件上传方法
        MyUtils.uploadSingleFile(file_aImg, c, "uploadfiles/userimgfiles/", "comimg");

        if(c.getComId()==null){
            //跳转到修改失败界面
            System.out.println("操作失败！");
            return "productInfoManager/HandRoomModify";
        }else{
            CommodityHouseBean com=new CommodityHouseBean();
            List<CommodityHouseBean> hlist=commodityHouseService.selectById(c);
            com=hlist.get(0);
            //修改订单名、商品图片
            HistoryBean his=new HistoryBean();
            his.setHouseName(com.getComName());
            List<HistoryBean> hisList=historyService.selectByHouseName(his);
            if(hisList!=null&&hisList.size()>0){
                for(HistoryBean hi:hisList){
                    hi.setHouseName(c.getComName());
                    hi.setHouseImg(c.getComImg());
                    historyService.saveOrUpdateUserInfo(hi);
                }
            }
            //修改收藏的商品名、商品图片
            CollectionBean col=new CollectionBean();
            col.setColName(com.getComName());
            List<CollectionBean> colList=collectionService.selectByParams(col);
            if(colList!=null&&colList.size()>0){
                for(CollectionBean co:colList){
                    co.setColName(c.getComName());
                    co.setColImg(c.getComImg());
                    collectionService.saveOrUpdateUserInfo(co);
                }
            }
            //.octet-stream不保存在数据库
            String yanzheng= c.getComImg().substring(c.getComImg().lastIndexOf("."));
            System.out.println(yanzheng);
            if(yanzheng.equals(".octet-stream")){
                List<CommodityHouseBean> infos = commodityHouseService.selectById(c);
                CommodityHouseBean comIn=new CommodityHouseBean();
                comIn=infos.get(0);
                c.setComImg(comIn.getComImg());
            }
            // 调用Service层进行用户信息数据保存和修改操作
            int i = commodityHouseService.saveOrUpdateUserInfo(c);
            // 根据操作结果进行视图转发处理
            return "productInfoManager/productInfoAddDetail";
        }


    }

    /**
     * 使用ajax进行删除操作
     *
     * @param comId 删除记录的主键id字段值
     * @return 删除操作的结果记录
     */
    @ResponseBody
    @RequestMapping("/deleteCommodityHouseByID")
    public int DeleteCommodityHouseByID(Integer comId) {
        CommodityHouseBean com=new CommodityHouseBean();
        com.setComId(comId);
        List<CommodityHouseBean> hlist=commodityHouseService.selectById(com);
        com=hlist.get(0);
        //修改订单名、商品图片
        HistoryBean his=new HistoryBean();
        his.setHouseName(com.getComName());
        List<HistoryBean> hisList=historyService.selectByHouseName(his);
        if(hisList!=null&&hisList.size()>0){
            for(HistoryBean hi:hisList){
                historyService.deleteUserInfoByID(hi.gethId());
            }
        }
        //修改收藏的商品名、商品图片
        CollectionBean col=new CollectionBean();
        col.setColName(com.getComName());
        List<CollectionBean> colList=collectionService.selectByParams(col);
        if(colList!=null&&colList.size()>0){
            for(CollectionBean co:colList){
                collectionService.deleteUserInfoByID(co.getColId());
            }
        }
        // 默认返回值
        int i = 0;
        // 调用service层进行删除操作
        i = commodityHouseService.deleteUserInfoByID(comId);
        return i;
    }
}
