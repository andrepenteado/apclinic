package com.github.andrepenteado.apclinic.repositories;

import com.github.andrepenteado.apclinic.entities.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    Usuario findUsuarioByLogin(String login);

}
