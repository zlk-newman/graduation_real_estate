package com.zlk.service;

import com.zlk.bean.AverageUserBean;

import java.util.List;

public interface IAverageUserService {

    /**
     * 登录查询：根据登录传入用户名密码进行登录查询操作
     *
     * @param averageUserBean 登录参数信息实体类
     * @return 查询结果集
     */
    public List<AverageUserBean> doLogin(AverageUserBean averageUserBean);
    public List<AverageUserBean> selectByAid(AverageUserBean averageUserBean);
    /**
     * 查询：根据用户名动态查询操作
     *
     * @param averageUserBean 登录参数信息实体类
     * @return 查询结果集
     */
    public List<AverageUserBean> selectUserInfoByParams(AverageUserBean averageUserBean);

    /**
     * 进行数据新增、修改操作
     *
     * @param averageUserBean 参数实体
     * @return 操作结果
     */
    public int saveOrUpdateUserInfo(AverageUserBean averageUserBean);

    /**
     * 进行数据删除操作
     *
     * @param aId 参数实体
     * @return 操作结果
     */
    public int deleteUserInfoByID(Integer aId);
}
