package com.shanzhu.flower.service;

import com.shanzhu.flower.entity.Flower;

import java.util.List;


public interface FlowersService {

    int add(Flower flower);
    int delete(int id);
    int update(Flower flower);
    List<Flower> find(String searchKey,String searchType);
    List<Flower> findAll(String searchKey);
    int updateImg(String img_guid,Integer id);
}
