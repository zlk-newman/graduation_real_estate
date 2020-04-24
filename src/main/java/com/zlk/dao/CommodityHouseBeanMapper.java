package com.zlk.dao;

import com.zlk.bean.CommodityHouseBean;

import java.util.List;

public interface CommodityHouseBeanMapper {
    //商品房删除
    int deleteByPrimaryKey(Integer comId);
    //商品房添加
    int insert(CommodityHouseBean record);
    //商品房带验证添加
    int insertSelective(CommodityHouseBean record);
    //商品房查询
    List<CommodityHouseBean> selectByPrimaryKey(CommodityHouseBean record);
    List<CommodityHouseBean> selectById(CommodityHouseBean record);
    //商品房全查
    List<CommodityHouseBean> selectCommodityFor(CommodityHouseBean record);
    //商品房模糊查询
    List<CommodityHouseBean> selectCommodityHouse(CommodityHouseBean record);
    List<CommodityHouseBean> selectCommodityHouseForA(CommodityHouseBean record);
    //商品房更新带验证
    int updateByPrimaryKeySelective(CommodityHouseBean record);
    //商品房更新
    int updateByPrimaryKey(CommodityHouseBean record);
}