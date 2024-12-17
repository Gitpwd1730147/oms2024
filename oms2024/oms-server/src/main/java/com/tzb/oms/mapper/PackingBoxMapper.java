package com.tzb.oms.mapper;

import com.tzb.oms.entity.PackingBox;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * AUTHOR: TZB
 * DATE:  2024/9/23
 */
public interface PackingBoxMapper {
    /**
     * 获得包装箱信息列表
     * @return
     */
    public List<PackingBox> selectAllPackingBox();

    /**
     * 新增包装箱信息
     * @param packingBox
     * @return
     */
    public int insertPackingBox(PackingBox packingBox);

    /**
     * 根据packingBoxId修改包装箱信息
     * @param packingBox
     * @return
     */
    public int updatePackingBox(PackingBox packingBox);

    /**
     * 根据packingBoxId删除包装箱信息
     * @param packingBoxId
     * @return
     */
    public int deletePackingBoxById(Integer packingBoxId);

    /**
     * 根据长宽高获得包装箱的packingBoxId
     * @param boxLenght
     * @param boxWidth
     * @param boxHigh
     * @return
     */
   public Integer selectPackingBoxIdByLWH(@Param("boxLength") Double boxLenght,@Param("boxWidth") Double boxWidth,@Param("boxHigh") Double boxHigh);
}