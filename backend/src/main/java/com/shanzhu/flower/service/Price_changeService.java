package com.shanzhu.flower.service;

import com.shanzhu.flower.entity.Price;
import com.shanzhu.flower.entity.Price_change;

import java.util.List;

public interface Price_changeService {
    List<Price_change> find(int price_id);

}
