package com.github.andrepenteado.apclinic.entities;

import com.github.andrepenteado.apclinic.entities.enums.Perfil;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "perfil_usuario")
@Data
@EqualsAndHashCode(of = { "usuario", "perfil" })
@ToString(of = { "usuario", "perfil" })
public class PerfilUsuario {

    @Id
    @SequenceGenerator(name = "perfil_usuario_id_seq", sequenceName = "perfil_usuario_id_seq", allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "perfil_usuario_id_seq")
    @Column(name = "Id", nullable = false)
    private Long id;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "id_usuario", referencedColumnName = "id")
    private Usuario usuario;

    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(name = "perfil")
    private Perfil perfil;
}
