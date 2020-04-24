package com.zlk.service.impl;

import com.zlk.bean.MassageBean;
import com.zlk.dao.MassageBeanMapper;
import com.zlk.service.IMassageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MassageService implements IMassageService {
    @Resource
    public MassageBeanMapper massageBeanMapper;
    @Override
    public List<MassageBean> selectOne(MassageBean massageBean){
        List<MassageBean> lists=massageBeanMapper.selectOne(massageBean);
        return lists;
    }
    @Override
    public List<MassageBean> selectByA(MassageBean MassageBean){
        List<MassageBean> lists=massageBeanMapper.selectByA(MassageBean);
        return lists;
    }
    @Override
    public List<MassageBean> selectByP(MassageBean MassageBean){
        List<MassageBean> lists=massageBeanMapper.selectByP(MassageBean);
        return lists;
    }
    @Override
    public int saveOrUpdateUserInfo(MassageBean MassageBean){
        int i = 0;
        if(MassageBean != null && MassageBean.getMasId() != null){
            i=massageBeanMapper.updateByPrimaryKeySelective(MassageBean);
        }else{
            i=massageBeanMapper.insertSelective(MassageBean);
        }
        return  i;
    }
    @Override
    public int deleteUserInfoByID(Integer id) {
        // 默认返回值
        int i = 0;

        i = massageBeanMapper.deleteByPrimaryKey(id);
        return i;
    }
}
