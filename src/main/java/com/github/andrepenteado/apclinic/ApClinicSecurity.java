package com.github.andrepenteado.apclinic;

import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@EnableWebSecurity
public class ApClinicSecurity extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication().passwordEncoder(NoOpPasswordEncoder.getInstance())
                        .withUser("func").password("func").roles(KGlobal.K_PERFIL_FUNCIONARIO)
                    .and()
                        .withUser("cliente").password("cliente").roles(KGlobal.K_PERFIL_CLIENTE);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                        .antMatchers("/index.jsp").permitAll().antMatchers("/erro").permitAll()
                        .anyRequest().authenticated()
                    .and()
                        .formLogin().loginPage("/home").permitAll()
                    .and()
                        .logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
    }
}
