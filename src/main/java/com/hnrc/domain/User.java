package com.hnrc.domain;


import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.Email;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serializable;
import java.util.Collection;

public class User implements Serializable, UserDetails {
    private static final long serialVersionUID = 4449360657035384941L;

    private int id;
    @Email
    private String username;
    @JsonIgnore
    private String password;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public static User current() {
        try {
            return (User) SecurityContextHolder.getContext()
                    .getAuthentication().getPrincipal();
        } catch (NullPointerException | ClassCastException e) {
            return null;
        }
    }



    @Override
    public int hashCode() {
        return new HashCodeBuilder(17, 31).append(getId()).toHashCode();
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        User other = (User) obj;
        return new EqualsBuilder().append(getId(), other.getId()).isEquals();
    }



    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
