package com.zlk.dao;

import com.zlk.bean.MassageBean;

import java.util.List;

public interface MassageBeanMapper {
    //删除信息
    int deleteByPrimaryKey(Integer masId);
    //添加信息
    int insert(MassageBean record);
    //条件添加信息
    int insertSelective(MassageBean record);
    //单条查询信息
    List<MassageBean> selectOne(MassageBean record);
    //查询信息-用户
    List<MassageBean> selectByA(MassageBean record);
    //查询信息-客户
    List<MassageBean> selectByP(MassageBean record);
    //条件更新信息
    int updateByPrimaryKeySelective(MassageBean record);
    //更新信息
    int updateByPrimaryKey(MassageBean record);
}