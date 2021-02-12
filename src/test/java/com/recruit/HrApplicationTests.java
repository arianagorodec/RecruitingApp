package com.recruit;

import com.recruit.controller.RegistrationController;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.core.StringContains.containsString;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
class HrApplicationTests {

	@Autowired
	private MockMvc mockMvc;
	@Autowired
	private RegistrationController registrationController;

	@Test
	void contextLoads() throws Exception {
		this.mockMvc.perform(get("/"))
				.andDo(print())
				.andExpect(status().isOk()) //assertThat
				.andExpect(content().string(containsString("")));
	}

	@Test
	public void accessDeniedTest() throws Exception{
		this.mockMvc.perform(get("/user"))
				.andDo(print())
				.andExpect(status().is3xxRedirection())
				.andExpect(redirectedUrl("http://localhost/"));
	}

	@Test
	public void correctLoginTest()throws Exception{
		this.mockMvc.perform(formLogin().userParameter("nikpetrov@gmail.com").password("1"))
		.andDo(print())
		.andExpect(status().is3xxRedirection())
		.andExpect(redirectedUrl("http://localhost/"));
	}
	@Test
	public void badCredentails() throws Exception{
		this.mockMvc.perform(post("/").param("user","Alala"))
				.andDo(print())
				.andExpect(status().is3xxRedirection())
				.andExpect(redirectedUrl("/?error"));
	}

}