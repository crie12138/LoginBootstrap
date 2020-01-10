package com.starnet.service;


import com.starnet.bean.User;

import java.math.BigInteger;
import java.util.List;

public interface UserService {

    List<User> listUser();

    int delByID(String ids);

    int add(User user);

    int upUser(User user);
}
