package com.zlk.service;

import com.zlk.bean.MassageBean;

import java.util.List;

public interface IMassageService {
    /**
     * 查询：单条查询操作
     *
     * @param massageBean 参数实体
     * @return 查询结果集
     */
    public List<MassageBean> selectOne(MassageBean massageBean);
    /**
     * 查询：根据用户名查询操作
     *
     * @param massageBean 参数实体
     * @return 查询结果集
     */
    public List<MassageBean> selectByA(MassageBean massageBean);
    /**
     * 查询：根据客户名查询操作
     *
     * @param massageBean 参数实体
     * @return 查询结果集
     */
    public List<MassageBean> selectByP(MassageBean massageBean);
    /**
     * 进行数据新增操作
     *
     * @param massageBean 参数实体
     * @return 操作结果
     */
    public int saveOrUpdateUserInfo(MassageBean massageBean);

    /**
     * 进行数据删除操作
     *
     * @param id 参数实体
     * @return 操作结果
     */
    public int deleteUserInfoByID(Integer id);
}
