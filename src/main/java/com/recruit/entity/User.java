package com.recruit.entity;

import com.recruit.entity.enums.RoleEnum;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Entity
@Table(name="user")
public class User implements UserDetails {
    @Id
    @GeneratedValue(generator = "native")
    @GenericGenerator(name= "native", strategy= "native")
    @Column(name = "id_user", length = 11, nullable = false)
    private long id_user;

    @Transient
    private String passwordConfirm;


    //@OneToMany(fetch = FetchType.EAGER, mappedBy = "user", cascade = CascadeType.ALL)
    @Column(name = "role")
    private RoleEnum role;

    @Column(name="username")
    private String username;
    @Column(name="password")
    private String password;
    @Column(name="activation_code")
    private String activationCode;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "userFrom", cascade = CascadeType.ALL)
    private Set<ChatMessage> chatMessagesFrom;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "userTo", cascade = CascadeType.ALL)
    private Set<ChatMessage> chatMessagesTo;

    @OneToOne(mappedBy="user", cascade = CascadeType.ALL)
    public Employee employee;

    @OneToOne(mappedBy="user", cascade = CascadeType.ALL)
    private Candidate candidate;

    //for registration
    @Transient
    private Person person=new Person();



    public User() {
    }

    public User(String passwordConfirm, RoleEnum role, String username, String password) {
        this.passwordConfirm = passwordConfirm;
        this.role = role;
        this.username = username;
        this.password = password;
    }

    public User(String passwordConfirm, RoleEnum role, String username, String password, Employee employee, Candidate candidate) {
        this.passwordConfirm = passwordConfirm;
        this.role = role;
        this.username = username;
        this.password = password;
        this.employee = employee;
        this.candidate = candidate;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public long getId() {
        return id_user;
    }

    public void setId(long id) {
        this.id_user = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public Candidate getCandidate() {
        return candidate;
    }

    public void setCandidate(Candidate candidate) {
        this.candidate = candidate;
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

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();

        list.add(new SimpleGrantedAuthority(role.getAuthority()));

        return list;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public RoleEnum getRole() {
        return role;
    }

    public void setRole(RoleEnum role) {
        this.role = role;
    }

    @Override
    public String getPassword() {
        return password;
    }

    //for registration
    public String getIdP() {
        return person.getId();
    }

    public void setIdP(String id) {
        this.person.setId(id);
    }

    public String getSurname() {
        return person.getSurname();
    }

    public void setSurname(String surname) {
        this.person.setSurname(surname);
    }

    public String getName() {
        return person.getName();
    }

    public void setName(String name) {
        this.person.setName(name);
    }

    public String getPatronymic() {
        return person.getPatronymic();
    }

    public void setPatronymic(String patronymic) {
        this.person.setPatronymic(patronymic);
    }

    public String getBirthday() {
        String date ="";
        if(person.getBirthday()!=null)
            if(!person.getBirthday().equals(""))
                date = new SimpleDateFormat("dd/MM/yyyy").format(person.getBirthday());
        return date;
    }

    public void setBirthday(String birthdayS) throws ParseException {
        if(birthdayS!=null) {
            if(!birthdayS.equals("")) {
                SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                Date birthday = format.parse(birthdayS);
                this.person.setBirthday(birthday);
            }
        }
    }

    public String getMobphone() {
        return person.getMobphone();
    }

    public void setMobphone(String mobphone) {
        this.person.setMobphone(mobphone);
    }

    public String getGender() {
        return person.getGender();
    }

    public void setGender(String gender) {
        this.person.setGender(gender);
    }


    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public long getId_user() {
        return id_user;
    }

    public void setId_user(long id_user) {
        this.id_user = id_user;
    }

    public Set<ChatMessage> getChatMessagesFrom() {
        return chatMessagesFrom;
    }

    public void setChatMessagesFrom(Set<ChatMessage> chatMessagesFrom) {
        this.chatMessagesFrom = chatMessagesFrom;
    }

    public void addChatMessagesFrom(ChatMessage chatMessageFrom) {
        this.chatMessagesFrom.add(chatMessageFrom);
    }

    public void addChatMessagesTo(ChatMessage chatMessageTo) {
        this.chatMessagesTo.add(chatMessageTo);
    }

    public Set<ChatMessage> getChatMessagesTo() {
        return chatMessagesTo;
    }

    public void setChatMessagesTo(Set<ChatMessage> chatMessagesTo) {
        this.chatMessagesTo = chatMessagesTo;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }
}
