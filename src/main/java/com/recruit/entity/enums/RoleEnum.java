package com.recruit.entity.enums;

import org.springframework.security.core.GrantedAuthority;

public enum RoleEnum implements GrantedAuthority {
    ROLE_USER,
    ROLE_ADMIN,
    ROLE_WORKER,
    ROLE_HR;

    RoleEnum() {
    }

    @Override
    public String getAuthority() {
        return name();
    }
}
