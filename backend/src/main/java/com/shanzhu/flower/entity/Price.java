package com.shanzhu.flower.entity;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class Price {

    private int id;
    private int flower_id;
    private String name;
    // 所属平台
    private String plat;
    private float price;
    // 详细介绍
    private String detail;
    // 图片
    private String img_guid;

}
