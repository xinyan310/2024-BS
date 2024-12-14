package com.shanzhu.flower.controller;

import com.shanzhu.flower.dao.Price_changeDao;
import com.shanzhu.flower.entity.Price_change;
import com.shanzhu.flower.service.Price_changeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("price")
@Slf4j  // 引入@Slf4j注解，自动生成log对象
public class Price_changeController {

    @Resource
    private Price_changeService price_changeService;

    @Resource
    private Price_changeDao price_changeDao;

    @GetMapping("/getPriceChangeTrend")
    public List<Price_change> getPricesByFlowerId(@RequestParam("id") int priceId) {
        // 输出 flowerId 到日志
        log.info("Request received to get price change data for priceId: {}", priceId);

        // 调用服务层方法获取该商品的所有价格变化数据
        List<Price_change> priceChanges = price_changeService.find(priceId);

        // 输出获取到的价格变化数据到日志，检查返回数据
        if (priceChanges != null && !priceChanges.isEmpty()) {
            log.info("Found {} price change records for priceId: {}", priceChanges.size(), priceId);
            for (Price_change priceChange : priceChanges) {
                log.info("Price Change: {}", priceChange);
            }
        } else {
            log.info("No price change records found for priceId: {}", priceId);
        }

        // 返回数据
        return priceChanges;
    }
}
