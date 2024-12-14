package com.shanzhu.flower.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

@Data
@Accessors(chain = true)


public class Price_change {

    private int id;
    private int price_id;
    private float price;
    private LocalDateTime data;  // 对应数据库中的 DATETIME 类型


}
