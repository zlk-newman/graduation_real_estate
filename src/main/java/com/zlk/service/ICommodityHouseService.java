package com.zlk.service;

import com.zlk.bean.CommodityHouseBean;

import java.util.List;

public interface ICommodityHouseService {
    /**
     * 数据查询
     * @return 查询结果集
     */
    public List<CommodityHouseBean> select(CommodityHouseBean commodityHouseBean);
    /**
     * 数据单条查询
     * @param commodityHouseBean
     * @return 查询结果集
     */
    public List<CommodityHouseBean> selectOne(CommodityHouseBean commodityHouseBean);
    public List<CommodityHouseBean> selectById(CommodityHouseBean commodityHouseBean);
    /**
     * 查询：动态查询操作
     *
     * @param commodityHouseBean
     * @return 查询结果集
     */
    public List<CommodityHouseBean> selectByParams(CommodityHouseBean commodityHouseBean);
    public List<CommodityHouseBean> selectByParamsForA(CommodityHouseBean commodityHouseBean);
    /**
     * 进行数据新增、修改操作
     *
     * @param commodityHouseBean 参数实体
     * @return 操作结果
     */
    public int saveOrUpdateUserInfo(CommodityHouseBean commodityHouseBean);

    /**
     * 进行数据删除操作
     *
     * @param id 参数实体
     * @return 操作结果
     */
    public int deleteUserInfoByID(Integer id);
}
