package com.zlk.dao;

import com.zlk.bean.HandRoomBean;

import java.util.List;

public interface HandRoomBeanMapper {
    //二手房删除
    int deleteByPrimaryKey(Integer handId);
    //二手房添加
    int insert(HandRoomBean record);
    //二手房带验证添加
    int insertSelective(HandRoomBean record);
    //二手房全查
    List<HandRoomBean> selectHandRoomFor(HandRoomBean record);
    //二手房查询
    List<HandRoomBean> selectByPrimaryKey(HandRoomBean record);
    List<HandRoomBean> selectHandById(HandRoomBean record);

    //二手房模糊查询（名称、价格、地址、房龄）
    List<HandRoomBean> selectHandRoom(HandRoomBean record);
    List<HandRoomBean> selectHandRoomForA(HandRoomBean record);
    //二手房带验证更新
    int updateByPrimaryKeySelective(HandRoomBean record);
    //二手房更新
    int updateByPrimaryKey(HandRoomBean record);
}