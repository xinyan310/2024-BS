package com.shanzhu.flower.controller;

import com.shanzhu.flower.config.Constant;
import com.shanzhu.flower.config.HttpMsg;
import com.shanzhu.flower.dao.FlowersDao;
import com.shanzhu.flower.entity.Cart;
import com.shanzhu.flower.entity.R;
import com.shanzhu.flower.service.CartService;
import com.shanzhu.flower.service.OrderService;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.util.StringUtil;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



@RestController
@RequestMapping("cart")
public class CartController {

    @Resource
    private CartService cartService;

    @Resource
    private OrderService orderService;

    @Resource
    private FlowersDao flowersDao;


    @RequestMapping("/queryByAccount")
    R queryByAccount(@RequestParam("account") String account) {
        R r = new R();

        if (StringUtil.isEmpty(account)) {
            return r.setCode(4000).setMsg(HttpMsg.INVALID_PARAM);
        }

        List<Cart> carts = cartService.queryByAccount(account);

        for (Cart cart : carts) {
            float price = flowersDao.queryPrice(cart.getFid());
            cart.setPrice(cart.getAmount() * price);
        }

        return r.setCode(2000).setData(carts);
    }



    @RequestMapping("/find")
    R find(
            @RequestParam("page") int page,
            @RequestParam("searchKey") String searchKey,
            @RequestParam("account") String account
    ) {

        R r = new R();

        Map<String, Object> map = new HashMap<>();
        List<Cart> carts = cartService.find(searchKey, account);

        if (carts == null) {
            return r.setCode(2000);
        }

        List<Cart> items = carts.size() >= page * Constant.PAGE_SIZE ?
                carts.subList((page - 1) * Constant.PAGE_SIZE, page * Constant.PAGE_SIZE)
                : carts.subList((page - 1) * Constant.PAGE_SIZE, carts.size());

        int len = carts.size() % Constant.PAGE_SIZE == 0 ? carts.size() / Constant.PAGE_SIZE
                : (carts.size() / Constant.PAGE_SIZE + 1);
        map.put("items", items);
        map.put("len", len);

        return r.setCode(2000).setData(map);
    }


    @RequestMapping("/buy")
    R buy(@RequestParam("account") String account) {
        R r = new R();

        // 查该用户的购物车
        List<Cart> carts = (List<Cart>) queryByAccount(account).getData();
        for (Cart cart : carts) {
            // 增加订单数据
            orderService.add(cart);
            // 删除购物车数据
            cartService.delete(cart.getId());
        }

        return r.setCode(2000).setMsg(HttpMsg.BUY_OK);
    }


    @RequestMapping("/create")
    R create(@RequestBody Cart cart) {
        R r = new R();

        int ans = cartService.add(cart);

        if (ans == 1) {
            return r.setCode(2000).setMsg(HttpMsg.ADD_CART_OK);
        }

        return r.setCode(4000).setMsg(HttpMsg.ADD_CART_FAILED);
    }


    @RequestMapping("/update")
    R update(@RequestBody Cart cart) {
        R r = new R();

        int ans = cartService.update(cart);

        if (ans >= 0) {
            return r.setCode(2000).setMsg(HttpMsg.UPDATE_USER_OK);
        }

        return r.setCode(4000).setMsg(HttpMsg.UPDATE_USER_FAILED);
    }


    @DeleteMapping("/delete")
    R delete(@RequestParam("id") int id) {
        R r = new R();
        int ans = cartService.delete(id);
        if (ans == 1) {
            return r.setCode(2000).setMsg(HttpMsg.DELETE_USER_OK);
        }
        return r.setCode(4000).setMsg(HttpMsg.DELETE_USER_FAILED);
    }

}

