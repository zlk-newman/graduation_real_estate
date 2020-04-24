package com.zlk.service.impl;

import com.zlk.bean.PropertyUserBean;
import com.zlk.dao.PropertyUserBeanMapper;
import com.zlk.service.IPropertyUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PropertyUserService implements IPropertyUserService {
    // 依赖注入和反转控制
    @Resource
    private PropertyUserBeanMapper PropertyUserM;
    @Override
    public List<PropertyUserBean> selectByPid(PropertyUserBean propertyUserBean){
        List<PropertyUserBean> userInfo=PropertyUserM.selectByPid(propertyUserBean);
        return userInfo;
    }
    @Override
    public List<PropertyUserBean> doLogin(PropertyUserBean propertyUserBean){
        List<PropertyUserBean> userInfo=PropertyUserM.selectForLogin(propertyUserBean);
        return userInfo;
    }

    @Override
    public int saveOrUpdateUserInfo(PropertyUserBean propertyUserBean) {
        // 默认返回值
        int i = 0;
        // 调用Dao层进行数据库数据保存和修改操作
        // 进行新增还是保存的业务逻辑处理
        // 通过判定实体类中的主键字段 suerid 是否为null，来决定进行新增还是修改操作
        if (propertyUserBean != null && propertyUserBean.getpId() != null) {
            // 修改操作
            i = PropertyUserM.updateByPrimaryKeySelective(propertyUserBean);
        } else {
            // 新增操作
            i = PropertyUserM.insertSelective(propertyUserBean);
        }
        return i;
    }

    @Override
    public List<PropertyUserBean> selectUserInfoByParams(PropertyUserBean PropertyUserBean) {
        // 调用dao曾经进行数据库查询操作
        List<PropertyUserBean> userInfo = PropertyUserM.selectPropertyUser(PropertyUserBean);
        // 返回结果集
        return userInfo;
    }

    @Override
    public int deleteUserInfoByID(Integer aId) {
        // 默认返回值
        int i = 0;

        i = PropertyUserM.deleteByPrimaryKey(aId);
        return i;
    }
}
