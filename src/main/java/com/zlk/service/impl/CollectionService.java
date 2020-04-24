package com.zlk.service.impl;

import com.zlk.bean.CollectionBean;
import com.zlk.dao.CollectionBeanMapper;
import com.zlk.service.ICollectionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CollectionService implements ICollectionService {
    @Resource
    public CollectionBeanMapper collectionBeanMapper;
    @Override
    public List<CollectionBean> selectByParams(CollectionBean collectionBean){
        List<CollectionBean> lists=collectionBeanMapper.selectByPrimaryKey(collectionBean);
        return lists;
    }
    @Override
    public List<CollectionBean> selectById(CollectionBean collectionBean){
        List<CollectionBean> lists=collectionBeanMapper.selectById(collectionBean);
        return lists;
    }
    @Override
    public List<CollectionBean> selectByA(CollectionBean collectionBean){
        List<CollectionBean> lists=collectionBeanMapper.selectByA(collectionBean);
        return lists;
    }
    @Override
    public int saveOrUpdateUserInfo(CollectionBean collectionBean){
        int i = 0;
        if(collectionBean != null && collectionBean.getColId() != null){
            i=collectionBeanMapper.updateByPrimaryKeySelective(collectionBean);
        }else{
            i=collectionBeanMapper.insertSelective(collectionBean);
        }
        return  i;
    }
    @Override
    public int deleteUserInfoByID(Integer id) {
        // 默认返回值
        int i = 0;

        i = collectionBeanMapper.deleteByPrimaryKey(id);
        return i;
    }

}
