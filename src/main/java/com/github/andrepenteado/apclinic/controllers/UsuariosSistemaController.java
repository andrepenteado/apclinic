package com.github.andrepenteado.apclinic.controllers;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/usuarios")
public class UsuariosSistemaController {

    @RequestMapping
    public String pesquisar() {
        return "usuarios/pesquisar";
    }
}
