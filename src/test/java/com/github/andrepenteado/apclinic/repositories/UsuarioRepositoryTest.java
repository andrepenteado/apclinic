package com.github.andrepenteado.apclinic.repositories;

/*
 * Autor: André Penteado
 * Data: 06/02/19 - 23:46
 */

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static com.github.andrepenteado.apclinic.repositories.specs.UsuarioSpecification.contemNome;
import static com.github.andrepenteado.apclinic.repositories.specs.UsuarioSpecification.igualLogin;
import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UsuarioRepositoryTest {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Test
    public void pesquisarPorLogin() {
        assertFalse(usuarioRepository.findAll(igualLogin("admin")).isEmpty());
        assertTrue(usuarioRepository.findAll(igualLogin("não-existe")).isEmpty());
    }

    @Test
    public void pesquisarPorNome() {
        assertFalse(usuarioRepository.findAll(contemNome("inistr")).isEmpty());
        assertTrue(usuarioRepository.findAll(contemNome("Não existe")).isEmpty());
    }
}
