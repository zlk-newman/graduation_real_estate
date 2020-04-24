package com.zlk.service;

import com.zlk.bean.HandRoomBean;

import java.util.List;

public interface IHandRoomService {
    /**
     * 数据查询
     * @return 查询结果集
     */
    public List<HandRoomBean> select(HandRoomBean handRoomBean);
    /**
     * 数据单条查询
     * @return 查询结果集
     */
    public List<HandRoomBean> selectOne(HandRoomBean handRoomBean);
    public List<HandRoomBean> selectById(HandRoomBean handRoomBean);
    /**
     * 查询：动态查询操作
     *
     * @param handRoomBean
     * @return 查询结果集
     */
    public List<HandRoomBean> selectByParams(HandRoomBean handRoomBean);
    public List<HandRoomBean> selectByParamsForA(HandRoomBean handRoomBean);

    /**
     * 进行数据新增、修改操作
     *
     * @param handRoomBean 参数实体
     * @return 操作结果
     */
    public int saveOrUpdateUserInfo(HandRoomBean handRoomBean);

    /**
     * 进行数据删除操作
     *
     * @param id 参数实体
     * @return 操作结果
     */
    public int deleteUserInfoByID(Integer id);
}
