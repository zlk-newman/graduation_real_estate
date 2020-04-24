package com.zlk.service.impl;

import com.zlk.bean.HandRoomBean;
import com.zlk.dao.HandRoomBeanMapper;
import com.zlk.service.IHandRoomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HandRoomService implements IHandRoomService {
    @Resource
    public HandRoomBeanMapper handRoomBeanMapper;

    @Override
    public List<HandRoomBean> select(HandRoomBean handRoomBean){
        List<HandRoomBean> allLists=handRoomBeanMapper.selectHandRoomFor(handRoomBean);
        return allLists;
    }
    @Override
    public List<HandRoomBean> selectById(HandRoomBean handRoomBean){
        List<HandRoomBean> allLists=handRoomBeanMapper.selectHandById(handRoomBean);
        return allLists;
    }
    @Override
    public List<HandRoomBean> selectByParams(HandRoomBean handRoomBean){
        List<HandRoomBean> paramLists=handRoomBeanMapper.selectHandRoom(handRoomBean);
        return paramLists;
    }
    @Override
    public List<HandRoomBean> selectByParamsForA(HandRoomBean handRoomBean){
        List<HandRoomBean> paramLists=handRoomBeanMapper.selectHandRoomForA(handRoomBean);
        return paramLists;
    }
    @Override
    public List<HandRoomBean> selectOne(HandRoomBean handRoomBean){
        List<HandRoomBean> oneList=handRoomBeanMapper.selectByPrimaryKey(handRoomBean);
        return oneList;
    }
    @Override
    public int saveOrUpdateUserInfo(HandRoomBean handRoomBean){
        int i = 0;
        if(handRoomBean != null && handRoomBean.getHandId() != null){
            i=handRoomBeanMapper.updateByPrimaryKeySelective(handRoomBean);
        }else{
            i=handRoomBeanMapper.insertSelective(handRoomBean);
        }
        return  i;
    }
    @Override
    public int deleteUserInfoByID(Integer id) {
        // 默认返回值
        int i = 0;

        i = handRoomBeanMapper.deleteByPrimaryKey(id);
        return i;
    }
}
