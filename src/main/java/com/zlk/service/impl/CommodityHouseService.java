package com.zlk.service.impl;

import com.zlk.bean.CommodityHouseBean;

import com.zlk.dao.CommodityHouseBeanMapper;

import com.zlk.service.ICommodityHouseService;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.List;

@Service
public class CommodityHouseService implements ICommodityHouseService {
    @Resource
    public CommodityHouseBeanMapper commodityHouseBeanMapper;

    @Override
    public List<CommodityHouseBean> select(CommodityHouseBean commodityHouseBean){
        List<CommodityHouseBean> allLists=commodityHouseBeanMapper.selectCommodityFor(commodityHouseBean);
        return allLists;
    }

    @Override
    public List<CommodityHouseBean> selectById(CommodityHouseBean commodityHouseBean){
        List<CommodityHouseBean> allLists=commodityHouseBeanMapper.selectById(commodityHouseBean);
        return allLists;
    }

    @Override
    public List<CommodityHouseBean> selectByParams(CommodityHouseBean commodityHouseBean){
        List<CommodityHouseBean> paramLists=commodityHouseBeanMapper.selectCommodityHouse(commodityHouseBean);
        return paramLists;
    }

    @Override
    public List<CommodityHouseBean> selectByParamsForA(CommodityHouseBean commodityHouseBean){
        List<CommodityHouseBean> paramLists=commodityHouseBeanMapper.selectCommodityHouseForA(commodityHouseBean);
        return paramLists;
    }
    @Override
    public List<CommodityHouseBean> selectOne(CommodityHouseBean commodityHouseBean){
        List<CommodityHouseBean> oneList=commodityHouseBeanMapper.selectByPrimaryKey(commodityHouseBean);
        return oneList;
    }
    @Override
    public int saveOrUpdateUserInfo(CommodityHouseBean commodityHouseBean){
        int i = 0;
        if(commodityHouseBean != null && commodityHouseBean.getComId() != null){
            i=commodityHouseBeanMapper.updateByPrimaryKeySelective(commodityHouseBean);
        }else{
            i=commodityHouseBeanMapper.insertSelective(commodityHouseBean);
        }
        return  i;
    }
    @Override
    public int deleteUserInfoByID(Integer id) {
        // 默认返回值
        int i = 0;

        i = commodityHouseBeanMapper.deleteByPrimaryKey(id);
        return i;
    }
}
