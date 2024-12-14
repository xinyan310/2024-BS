package com.shanzhu.flower.dao;

import com.shanzhu.flower.entity.Price;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface PriceDao {

    @Select("SELECT * FROM prices WHERE flower_id = #{flowerId}")
    List<Price> find(int flowerId);

}




