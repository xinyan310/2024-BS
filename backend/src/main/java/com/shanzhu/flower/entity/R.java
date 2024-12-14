package com.shanzhu.flower.entity;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class R {
    private int code;
    private String msg;
    private Object data;

}



