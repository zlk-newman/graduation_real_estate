package com.zlk.dao;

import com.zlk.bean.PropertyUserBean;

import java.util.List;

public interface PropertyUserBeanMapper {
    //通过id删除
    int deleteByPrimaryKey(Integer pId);
    //直接添加
    int insert(PropertyUserBean record);
    //带判断的添加
    int insertSelective(PropertyUserBean record);
    //根据id查询
    List<PropertyUserBean> selectByPid(PropertyUserBean record);
    //登录查询
    List<PropertyUserBean> selectForLogin(PropertyUserBean record);
    //根据名字动态查询
    List<PropertyUserBean> selectPropertyUser(PropertyUserBean record);
    //带判断的修改
    int updateByPrimaryKeySelective(PropertyUserBean record);
    //不带判断的修改
    int updateByPrimaryKey(PropertyUserBean record);
}