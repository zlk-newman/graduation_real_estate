package com.zlk.dao;

import com.zlk.bean.HistoryBean;

import java.util.List;

public interface HistoryBeanMapper {
    //历史记录删除
    int deleteByPrimaryKey(Integer hId);
    //历史记录添加
    int insert(HistoryBean record);
    //历史记录条件添加
    int insertSelective(HistoryBean record);
    //历史记录查询
    List<HistoryBean> selectByName(HistoryBean record);
    List<HistoryBean> selectByHouseName(HistoryBean record);
    //历史记录查询(用户)
    List<HistoryBean> selectForA(HistoryBean record);
    //历史记录查询(客户)
    List<HistoryBean> selectForP(HistoryBean record);
    //历史记录条件更新
    int updateByPrimaryKeySelective(HistoryBean record);
    //历史记录更新
    int updateByPrimaryKey(HistoryBean record);
}