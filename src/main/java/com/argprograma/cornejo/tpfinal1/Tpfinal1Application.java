package com.argprograma.cornejo.tpfinal1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.argprograma.cornejo.tpfinal1.model.Incidente;
import com.argprograma.cornejo.tpfinal1.services.IncidenteServices;

@SpringBootApplication
public class Tpfinal1Application {

	private IncidenteServices incidenteServices;
	@Autowired
	public Tpfinal1Application(IncidenteServices incidenteServices) {
		
		this.incidenteServices = incidenteServices;
	}

	public static void main(String[] args) {
		SpringApplication.run(Tpfinal1Application.class, args);
		
	//	0,10-10-2022,"adasa","pepepe",10-10-2022,10-10-2022,10-10-2022,
		Incidente e1= new Incidente();
		
		
	}
	
	
	
	

}
