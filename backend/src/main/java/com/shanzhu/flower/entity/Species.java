package com.shanzhu.flower.entity;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class Species {
    private int id;
    private String species_name;

}



