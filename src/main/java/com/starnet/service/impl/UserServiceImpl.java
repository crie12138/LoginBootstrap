package com.starnet.service.impl;


import com.starnet.bean.User;
import com.starnet.dao.UserDao;
import com.starnet.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.BitSet;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public List<User> listUser() {
        return userDao.selectAll();
    }

    @Override
    public int delByID(String ids) {
        String[] ss = ids.split(",");
        int count = 0;
        for (String s : ss) {
            userDao.deleteByKey(Integer.parseInt(s));
            count++;
        }
        return count;
    }

    @Override
    public int add(User user) {
        return userDao.insertSelective(user);
    }

    @Override
    public int upUser(User user) {
        return userDao.updateByPrimaryKeySelective(user);
    }

}
