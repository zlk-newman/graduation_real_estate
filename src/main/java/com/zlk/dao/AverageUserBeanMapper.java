package com.zlk.dao;

import com.zlk.bean.AverageUserBean;

import java.util.List;

public interface AverageUserBeanMapper {
    //通过id删除
    int deleteByPrimaryKey(Integer aId);
    //直接添加
    int insert(AverageUserBean record);
    //带判断的添加
    int insertSelective(AverageUserBean record);
    //登录查询
    List<AverageUserBean> selectForLogin(AverageUserBean record);
    List<AverageUserBean> selectByAid(AverageUserBean record);
    //根据名字动态查询
    List<AverageUserBean> selectAverageUser(AverageUserBean record);
    //带判断的修改
    int updateByPrimaryKeySelective(AverageUserBean record);
    //不带判断的修改
    int updateByPrimaryKey(AverageUserBean record);
}