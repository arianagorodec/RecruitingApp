package com.recruit.service;

import com.recruit.entity.User;

import java.util.List;


public interface UserService {
        User addUser(User user);

        void deleteById(long id);

        User getById_user(long id);

        User getByUsername(String username);

        User editUser(User user);

        List<User> getAdmin();
}
