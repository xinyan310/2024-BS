package com.shanzhu.flower.service.impl;
import com.shanzhu.flower.dao.PriceDao;
import com.shanzhu.flower.dao.SpeciesDao;
import com.shanzhu.flower.entity.Price;
import com.shanzhu.flower.service.PriceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.annotation.processing.ProcessingEnvironment;
import java.util.List;

@Service
public class PriceServiceImpl implements PriceService {
    @Resource
    private PriceDao priceDao;

    @Override
    public List<Price> find(int flower_id) {
        return priceDao.find(flower_id);
    }
}
