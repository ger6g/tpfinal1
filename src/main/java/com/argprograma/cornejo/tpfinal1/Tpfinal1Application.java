package com.argprograma.cornejo.tpfinal1;
import com.argprograma.cornejo.tpfinal1.model.Servicio;
import com.argprograma.cornejo.tpfinal1.model.TipoProblema;
import com.argprograma.cornejo.tpfinal1.model.tecnico;
import com.argprograma.cornejo.tpfinal1.model.Cliente;
import com.argprograma.cornejo.tpfinal1.model.Especialidad;
import com.argprograma.cornejo.tpfinal1.model.EstadoEnum;
import com.argprograma.cornejo.tpfinal1.services.ClienteServices;
import com.argprograma.cornejo.tpfinal1.services.EspecialidadServices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.argprograma.cornejo.tpfinal1.model.Incidente;
import com.argprograma.cornejo.tpfinal1.model.MedioComunicacion;
import com.argprograma.cornejo.tpfinal1.model.MedioEnum;
import com.argprograma.cornejo.tpfinal1.services.IncidenteServices;
import com.argprograma.cornejo.tpfinal1.services.MedioComunicacionServices;
import com.argprograma.cornejo.tpfinal1.services.TecnicoServices;
import com.argprograma.cornejo.tpfinal1.services.TipoProblemaServices;

import java.lang.reflect.Array;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@SpringBootApplication
public class Tpfinal1Application {

	private static IncidenteServices incidenteServices;
	private static ClienteServices clienteServices;
	private static EspecialidadServices especialidadServices;
	private static TecnicoServices tecnicoServices;
	private static TipoProblemaServices tipoProblemaServices;
	private static MedioComunicacionServices medioComunicacionServices;
	@Autowired
	public Tpfinal1Application(IncidenteServices incidenteServices,ClienteServices clienteServices,EspecialidadServices especialidadServices,TecnicoServices tecnicoServicio,TipoProblemaServices tipoProblemaServices,MedioComunicacionServices medioComunicacionServices) {
		
		this.incidenteServices = incidenteServices;
		this.clienteServices = clienteServices;
		this.especialidadServices= especialidadServices;
		this.tecnicoServices = tecnicoServicio;
		this.tipoProblemaServices = tipoProblemaServices;
		this.medioComunicacionServices = medioComunicacionServices;
	}

	public static void main(String[] args) {
		SpringApplication.run(Tpfinal1Application.class, args);



		List<Servicio> listaServicio = Collections.singletonList((Servicio.linux));

		Cliente cli0= new Cliente(0,"pepe","argento","arg@hotmail.com","12312333","nose",listaServicio);

		cli0.setId(clienteServices.Guardarcliente(cli0).getId());
		
		Especialidad esp1= new Especialidad(0,"limpiezaSistemas","optimizacion de Sistemas");
		
		esp1.setId(especialidadServices.GuardarEspecialidad(esp1).getId());
		
		List<Especialidad> listaEspec= new ArrayList<>();
		listaEspec.add(esp1);
		
		tecnico tecnico1= new tecnico(0,"hector","aki","nex@hotmail.com","123132","TecnoSoluciones S.A.",listaEspec);
		
		tecnico1.setId(tecnicoServices.GuardarTecnico(tecnico1).getId());
		
		MedioComunicacion medio1= new MedioComunicacion(0,MedioEnum.EMAIL,"030303",tecnico1);
		
		medio1.setId(medioComunicacionServices.GuardarMedio(medio1).getId());
		
		TipoProblema problema1=new TipoProblema(0,"ralentización de sistema",4,7,esp1);
		
		problema1.setId(tipoProblemaServices.GuardarProblema(problema1).getId());
		
		Incidente inc1=new Incidente(0,LocalDate.of(2000, 1, 1),"problemas con linux","funciona lento",LocalDate.of(2000, 1, 1),LocalDate.of(2000, 1, 1),LocalDate.of(2000, 1, 1),EstadoEnum.FINALIZADO,"ninguna",cli0,problema1,Servicio.linux,esp1,tecnico1);
		
		inc1.setId(incidenteServices.GuardarIncidente(inc1).getId());

	}
	
	
	
	

}
