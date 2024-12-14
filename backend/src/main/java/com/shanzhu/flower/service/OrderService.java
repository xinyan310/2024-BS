package com.shanzhu.flower.service;

import com.shanzhu.flower.entity.Cart;
import com.shanzhu.flower.entity.Order;

import java.util.List;


public interface OrderService {

    int add(Cart cart);
    int delete(int uid);
    int update(Order order);
    List<Order> find(String searchKey, String account);
    List<Order> findAll(String searchKey);
    List<Order> queryByAccount(String account);
}
