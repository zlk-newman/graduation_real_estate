package com.zlk.service.impl;


import com.zlk.bean.AverageUserBean;
import com.zlk.dao.AverageUserBeanMapper;
import com.zlk.service.IAverageUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class AverageUserService implements IAverageUserService {

    // 依赖注入和反转控制
    @Resource
    private AverageUserBeanMapper AverageUserM;
    @Override
    public List<AverageUserBean> selectByAid(AverageUserBean averageUserBean){
        List<AverageUserBean> userInfo=AverageUserM.selectByAid(averageUserBean);
        return userInfo;
    }

    @Override
    public List<AverageUserBean> doLogin(AverageUserBean averageUserBean){
        List<AverageUserBean> userInfo=AverageUserM.selectForLogin(averageUserBean);
        return userInfo;
    }
    @Override
    public int saveOrUpdateUserInfo(AverageUserBean averageUserBean) {
        // 默认返回值
        int i = 0;
        // 调用Dao层进行数据库数据保存和修改操作
        // 进行新增还是保存的业务逻辑处理
        // 通过判定实体类中的主键字段 suerid 是否为null，来决定进行新增还是修改操作
        if (averageUserBean != null && averageUserBean.getaId() != null) {
            // 修改操作
            i = AverageUserM.updateByPrimaryKeySelective(averageUserBean);
        } else {
            // 新增操作
            i = AverageUserM.insertSelective(averageUserBean);
        }
        return i;
    }

    @Override
    public List<AverageUserBean> selectUserInfoByParams(AverageUserBean averageUserBean) {
        // 调用dao曾经进行数据库查询操作
        List<AverageUserBean> userInfo = AverageUserM.selectAverageUser(averageUserBean);
        // 返回结果集
        return userInfo;
    }

    @Override
    public int deleteUserInfoByID(Integer aId) {
        // 默认返回值
        int i = 0;

        i = AverageUserM.deleteByPrimaryKey(aId);
        return i;
    }

}
