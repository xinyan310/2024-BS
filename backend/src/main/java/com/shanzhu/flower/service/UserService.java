package com.shanzhu.flower.service;

import com.shanzhu.flower.entity.User;

import java.util.List;


public interface UserService {

    int add(User user);
    int delete(int uid);
    int update(User user);
    List<User> find(String searchKey);
    User queryInfo(String account);
}
