package com.shanzhu.flower.service.impl;

import com.shanzhu.flower.dao.Price_changeDao;
import com.shanzhu.flower.dao.SpeciesDao;
import com.shanzhu.flower.entity.Price_change;
import com.shanzhu.flower.service.Price_changeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.annotation.processing.ProcessingEnvironment;
import java.util.List;

@Service
public class Price_changeServiceImpl implements Price_changeService {
    @Resource
    private Price_changeDao price_changeDao;

    @Override
    public List<Price_change> find(int price_id) {
        return price_changeDao.find(price_id);
    }
}