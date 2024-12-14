package com.shanzhu.flower.dao;

import com.shanzhu.flower.entity.Price;
import com.shanzhu.flower.entity.Price_change;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface Price_changeDao {
    @Select("SELECT * FROM price_change WHERE price_id = #{priceId}")
    List<Price_change> find(int priceId);

}
