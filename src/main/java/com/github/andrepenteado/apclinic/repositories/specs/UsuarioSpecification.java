package com.github.andrepenteado.apclinic.repositories.specs;

/*
 * Autor: André Penteado
 * Data: 06/02/19 - 23:39
 */

import com.github.andrepenteado.apclinic.entities.Usuario;
import org.springframework.data.jpa.domain.Specification;

public final class UsuarioSpecification {

    public static Specification<Usuario> igualLogin(String login) {
        return (usuario, cq, cb) -> cb.equal(usuario.get("login"), login);
    }

    public static  Specification<Usuario> contemNome(String nome) {
        return (usuario, cq, cb) -> cb.like(cb.lower(usuario.get("nome")), "%" + nome.toLowerCase() + "%");
    }
}
