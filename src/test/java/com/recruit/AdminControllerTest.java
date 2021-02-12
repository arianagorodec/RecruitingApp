package com.recruit;

import com.recruit.controller.AdminController;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
@WithUserDetails("admin")
public class AdminControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private AdminController adminController;

    @Test
    public void adminPageTest() throws Exception{
        this.mockMvc.perform(get("/admin"))
                .andDo(print())
                .andExpect(authenticated());
//                .andExpect(model().attribute("email", equalTo("nikpetrov@gmail.com")));
    }
}
