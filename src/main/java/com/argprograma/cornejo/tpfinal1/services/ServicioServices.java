package com.argprograma.cornejo.tpfinal1.services;

import com.argprograma.cornejo.tpfinal1.model.Cliente;
import com.argprograma.cornejo.tpfinal1.model.Servicio;
import com.argprograma.cornejo.tpfinal1.repositories.ServicioRepository;
import org.springframework.beans.factory.annotation.Autowired;

public class ServicioServices {
    ServicioRepository servicioRepository;
@Autowired
    public ServicioServices(ServicioRepository servicioRepository) {
        this.servicioRepository = servicioRepository;
    }
    public Servicio GuardarServicio (Servicio s){

        return servicioRepository.save(s);

    }
}
