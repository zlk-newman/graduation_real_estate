package com.zlk.service.impl;

import com.zlk.bean.HandRoomBean;
import com.zlk.bean.HistoryBean;
import com.zlk.dao.HistoryBeanMapper;
import com.zlk.service.IHistoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class HistoryService implements IHistoryService {
    @Resource
    public HistoryBeanMapper historyBeanMapper;
    @Override
    public List<HistoryBean> selectByName(HistoryBean historyBean){
        List<HistoryBean> lists=historyBeanMapper.selectByName(historyBean);
        return lists;
    }
    @Override
    public List<HistoryBean> selectByHouseName(HistoryBean historyBean){
        List<HistoryBean> lists=historyBeanMapper.selectByHouseName(historyBean);
        return lists;
    }
    @Override
    public List<HistoryBean> selectForA(HistoryBean historyBean){
        List<HistoryBean> lists=historyBeanMapper.selectForA(historyBean);
        return lists;
    }
    @Override
    public List<HistoryBean> selectForP(HistoryBean historyBean){
        List<HistoryBean> lists=historyBeanMapper.selectForP(historyBean);
        return lists;
    }
    @Override
    public int saveOrUpdateUserInfo(HistoryBean historyBean){
        int i = 0;
        if(historyBean != null && historyBean.gethId() != null){
            i=historyBeanMapper.updateByPrimaryKeySelective(historyBean);
        }else{
            i=historyBeanMapper.insertSelective(historyBean);
        }
        return  i;
    }
    @Override
    public int deleteUserInfoByID(Integer id) {
        // 默认返回值
        int i = 0;

        i = historyBeanMapper.deleteByPrimaryKey(id);
        return i;
    }
}
