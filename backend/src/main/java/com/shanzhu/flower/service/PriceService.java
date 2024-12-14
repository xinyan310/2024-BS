package com.shanzhu.flower.service;

import com.shanzhu.flower.entity.Price;


import java.util.List;


public interface PriceService {

    List<Price> find(int flower_id);

}
