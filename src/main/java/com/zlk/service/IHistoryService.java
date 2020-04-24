package com.zlk.service;

import com.zlk.bean.HistoryBean;

import java.util.List;

public interface IHistoryService {
    /**
     * 查询：根据用户名查询操作
     *
     * @param historyBean 参数实体
     * @return 查询结果集
     */
    public List<HistoryBean> selectByName(HistoryBean historyBean);
    public List<HistoryBean> selectByHouseName(HistoryBean historyBean);
    /**
     * 查询：根据用户名查询操作（用户）
     *
     * @param historyBean 参数实体
     * @return 查询结果集
     */
    public List<HistoryBean> selectForA(HistoryBean historyBean);
    /**
     * 查询：根据用户名查询操作(客户)
     *
     * @param historyBean 参数实体
     * @return 查询结果集
     */
    public List<HistoryBean> selectForP(HistoryBean historyBean);
    /**
     * 进行数据新增操作
     *
     * @param historyBean 参数实体
     * @return 操作结果
     */
    public int saveOrUpdateUserInfo(HistoryBean historyBean);

    /**
     * 进行数据删除操作
     *
     * @param id 参数实体
     * @return 操作结果
     */
    public int deleteUserInfoByID(Integer id);
}
