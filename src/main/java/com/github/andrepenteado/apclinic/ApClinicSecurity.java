package com.github.andrepenteado.apclinic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.sql.DataSource;

@EnableWebSecurity
public class ApClinicSecurity extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    private final String userQuery = "SELECT Login, Senha, 1 FROM Usuario WHERE Login = ? AND (Expiracao IS NULL OR Expiracao > CURRENT_DATE)";

    private final String roleQuery = "SELECT u.Login, p.Perfil FROM Perfil_Usuario p, Usuario u WHERE u.Id = p.Id_Usuario AND u.Login = ?";

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery(userQuery)
                .authoritiesByUsernameQuery(roleQuery)
                .passwordEncoder(new BCryptPasswordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                        .antMatchers("/index.jsp").permitAll()
                        .antMatchers("/erro").permitAll()
                        .antMatchers("/assets/**").permitAll()
                        .anyRequest().authenticated()
                    .and()
                        .formLogin().loginPage("/home").permitAll()
                    .and()
                        .logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"));
    }
}
