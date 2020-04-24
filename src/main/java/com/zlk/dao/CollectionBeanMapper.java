package com.zlk.dao;

import com.zlk.bean.CollectionBean;

import java.util.List;

public interface CollectionBeanMapper {
    //收藏删除
    int deleteByPrimaryKey(Integer colId);
    //收藏添加
    int insert(CollectionBean record);
    //收藏条件添加
    int insertSelective(CollectionBean record);
    //收藏根据用户名查询
    List<CollectionBean> selectByA(CollectionBean record);
    List<CollectionBean> selectByPrimaryKey(CollectionBean record);
    List<CollectionBean> selectById(CollectionBean record);
    //收藏条件更新
    int updateByPrimaryKeySelective(CollectionBean record);
    //收藏更新
    int updateByPrimaryKey(CollectionBean record);
}