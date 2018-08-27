package com.github.andrepenteado.apclinic.controllers;

import com.github.andrepenteado.apclinic.entities.Usuario;
import com.github.andrepenteado.apclinic.repositories.UsuarioRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/usuarios")
public class UsuariosSistemaController {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @RequestMapping
    public String pesquisar() {
        return "usuarios/pesquisar";
    }

    @RequestMapping("/meusdados")
    public String meusDados(@AuthenticationPrincipal User user, Model model) {
        Usuario usuario = usuarioRepository.findUsuarioByLogin(user.getUsername());
        model.addAttribute("usuario", usuario);
        return "usuarios/meus-dados";
    }
}
