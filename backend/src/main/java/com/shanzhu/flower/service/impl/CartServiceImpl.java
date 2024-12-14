package com.shanzhu.flower.service.impl;

import com.shanzhu.flower.dao.CartDao;
import com.shanzhu.flower.dao.UserDao;
import com.shanzhu.flower.entity.Cart;
import com.shanzhu.flower.service.CartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Resource
    private CartDao cartDao;

    @Resource
    private UserDao userDao;

    @Override
    public int add(Cart cart) {
        int uid = userDao.queryIdByAccount(cart.getAccount());
        cart.setUid(uid);
        Cart cart1 = cartDao.checkIsAdded(cart);
        if (cart1==null){
            return cartDao.add(cart);
        }else {
            return cartDao.addAmount(cart);
        }
    }

    @Override
    public int delete(int uid) {
        return cartDao.delete(uid);
    }

    @Override
    public int update(Cart cart) {
        return cartDao.update(cart);
    }

    @Override
    public List<Cart> find(String searchKey,String account) {
        return cartDao.find(searchKey,account);
    }

    @Override
    public List<Cart> queryByAccount(String account) {
        Integer uid = userDao.queryIdByAccount(account);
        return cartDao.queryByUid(uid);
    }


}
