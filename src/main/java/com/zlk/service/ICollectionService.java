package com.zlk.service;

import com.zlk.bean.CollectionBean;

import java.util.List;

public interface ICollectionService {

    /**
     * 查询：根据用户名查询操作
     *
     * @param collectionBean 参数实体
     * @return 查询结果集
     */
    public List<CollectionBean> selectByA(CollectionBean collectionBean);
    public List<CollectionBean> selectByParams(CollectionBean collectionBean);
    public List<CollectionBean> selectById(CollectionBean collectionBean);
    /**
     * 进行数据新增操作
     *
     * @param collectionBean 参数实体
     * @return 操作结果
     */
    public int saveOrUpdateUserInfo(CollectionBean collectionBean);

    /**
     * 进行数据删除操作
     *
     * @param id 参数实体
     * @return 操作结果
     */
    public int deleteUserInfoByID(Integer id);
}
