package com.shanzhu.flower.controller;

import com.shanzhu.flower.dao.PriceDao;
import com.shanzhu.flower.entity.Price;
import com.shanzhu.flower.service.PriceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("price")
@Slf4j  // 引入@Slf4j注解，自动生成log对象
public class PriceController {

    @Resource
    private PriceService priceService;

    @Resource
    private PriceDao priceDao;

    @GetMapping("/getPricesByFlowerId")
    public List<Price> getPricesByFlowerId(@RequestParam("id") int flowerId) {
        // 输出 flowerId 到日志
        log.info("Request received to get prices for flowerId: {}", flowerId);

        // 调用服务层方法获取该商品的所有价格项
        return priceService.find(flowerId);
    }
}
