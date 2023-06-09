
// Este subproceso imprime una interfaz y permite al usuario elegir que funcion utilizar
SubProceso  menu
	// En esta variable (num_1) guardaremos el numero ingresado por el usuario
	Definir num_1,i Como Entero;
	Definir swicht Como Logico;
	Definir numeroPaciente como Entero;
	Definir datosPacientes como Cadena;
	
	Dimension datosPacientes[999,7];
	
	Para i <- 0 Hasta 998 Hacer
		datosPacientes[i,6] <- "";
	FinPara
	
	numeroPaciente <- 0;
	swicht <- Falso;
	
	// Mientras el usuario no ingrese la opcion terminar se imprimira el menu
	Mientras swicht = Falso Hacer
		Escribir "";
		Escribir "                            ****************    ";
		Escribir "                            SISTEMA HOSPITAL    ";
		Escribir "                            ****************    ";
		Escribir "";
		Escribir "                         1) Ingresar paciente";
		Escribir "                         2) Buscar paciente";
		Escribir "                         3) Modificar paciente";
		Escribir "                         4) Eliminar paciente";
		Escribir "                         5) Salir";
		Escribir "";
		Escribir "                           Elija una opción: " Sin Saltar;
		leer num_1;
		// Si el número ingresado es no es válido
		Si num_1 <> 1 Y num_1 <> 2 Y num_1 <> 3 Y num_1 <> 4 Y num_1 <> 5 Entonces
			Escribir "Ingrese una opción válida.";
			Escribir "";
		Sino
			// Si ingresa 1)
			Si num_1 = 1 Entonces
				// Se llama el subproceso ingresar
				ingresar(datosPacientes,numeroPaciente);
			SiNo
				// Si ingresa 2)
				Si num_1 = 2 Entonces
					// Se llama el subproceso buscar
					buscar(datosPacientes,numeroPaciente);
				SiNo
					// Si ingresa 3
					Si num_1 = 3 Entonces
						// Se llama el subproceso modificar
						modificar;
					SiNo
						Si num_1 = 4 Entonces
							// Se llama el subproceso eliminar
							Eliminar;
						SiNo
							Si num_1 = 5 Entonces
								// Termina el programa 
								swicht <- Verdadero;
								Limpiar Pantalla;
							FinSi
						FinSi	
					FinSi
				FinSi
			FinSi
		FinSi
	FinMientras
FinSubProceso



SubProceso ingresar(datosPacientes Por Referencia,numeroPaciente Por Referencia )
	Definir num_1,num_2,i,long,dni,contador Como Entero;
	Definir tipoSangre como Cadena;
	Definir swichtSangre Como Logico;
	Definir especialidad como Cadena;
	Definir swichtEspecialidad Como Logico;
	Definir swichtDni Como Logico;
	Definir swichtDni_2 Como Logico;
	
	Dimension tipoSangre[8];
	tipoSangre[0] <- "a+";
	tipoSangre[1] <- "b+";
	tipoSangre[2] <- "ab+";
	tipoSangre[3] <- "0+";
	tipoSangre[4] <- "a-";
	tipoSangre[5] <- "b-";
	tipoSangre[6] <- "ab-";
	tipoSangre[7] <- "0-";
	
	Dimension especialidad[7];
	especialidad[0] <- "Cardiología";
	especialidad[1] <- "Traumatología";
	especialidad[2] <- "Odontología";
	especialidad[3] <- "Pediatría";
	especialidad[4] <- "Clínica";
	especialidad[5] <- "Radiología";
	especialidad[6] <- "Dermatología";
	

	Limpiar Pantalla;
	datosPacientes[numeroPaciente,0] <- ConvertirATexto(numeroPaciente);
	Escribir "Ingrese el nombre del paciente: " Sin Saltar;
	Leer datosPacientes[numeroPaciente,1];
	Limpiar Pantalla;
	Escribir "Ingrese el apellido del paciente: " Sin Saltar;
	Leer datosPacientes[numeroPaciente,2];
	Limpiar Pantalla;
	
	Escribir "Ingrese el DNI del paciente: " Sin Saltar;
	Leer dni;
	Limpiar Pantalla;
	
	contador <- 0;
	swichtDni_2 <- Falso;
	Mientras swichtDni_2 = Falso Hacer
		
		Para i <- 0 Hasta 998 Hacer
			Si ConvertirANumero(datosPacientes[i,6]) = dni Entonces
				i <- 998;
				Escribir "El DNI ingresado ya esta en uso";
				Escribir "Ingrese el DNI del paciente: " Sin Saltar;
				Leer dni;
				Limpiar Pantalla;
			SiNo
				contador <- contador + 1;
				
			FinSi
		FinPara
		
		Si contador = 999 Entonces
			swichtDni_2 <- Verdadero;
		FinSi
		
	FinMientras
	
	swichtDni <- Falso;
	Mientras swichtDni = Falso  Hacer
		
		long <- Longitud(ConvertirATexto(dni));
		Si long > 5 Y long < 9  Entonces
			swichtDni <- Verdadero;
		FinSi
		
		
		Si swichtDni = Falso Entonces
			Escribir "Debe ingresar un DNI válido";
			Escribir "Ingrese el DNI del paciente: " Sin Saltar;
			Leer datosPacientes[numeroPaciente,6];
			Limpiar Pantalla;
		FinSi
		
	FinMientras
	
	datosPacientes[numeroPaciente,6] <- ConvertirATexto(dni);
	
	Escribir "Ingrese la edad del paciente: " Sin Saltar;
	Leer datosPacientes[numeroPaciente,3];
	Limpiar Pantalla;
	
	Escribir "Ingrese tipo de sangre del paciente: " Sin Saltar;
	Leer datosPacientes[numeroPaciente,4];
	Limpiar Pantalla;
	
	swichtSangre <- Falso;
	Mientras swichtSangre = Falso Hacer
		
		Para i <- 0 Hasta 7 Hacer
			Si Minusculas(datosPacientes[numeroPaciente,4]) = tipoSangre[i] Entonces
				swichtSangre <- Verdadero;
			FinSi
		FinPara
		
		Si swichtSangre = Falso Entonces
			Escribir "Debe ingresar un tipo de sangre válido (A+, B+, AB+, 0+, A-, B-, AB-, 0-)";
			Escribir "Ingrese tipo de sangre del paciente: " Sin Saltar;
			Leer datosPacientes[numeroPaciente,4];
			Limpiar Pantalla;
		FinSi
		
	FinMientras
	
	Escribir "                 Especialidades:";
	Escribir "1)Cardiología";
	Escribir "2)Traumatología";
	Escribir "3)Odontologia";
	Escribir "4)Pediatría";
	Escribir "5)Clínica";
	Escribir "6)Radiología";
	Escribir "7)Dermatología";
	Escribir "";
	Escribir "       Ingrese una opción: " Sin Saltar;
	Leer num_2;
	Limpiar Pantalla;
	
	swichtEspecialidad <- Falso;
	Mientras swichtEspecialidad = Falso Hacer
		
		
		Si num_2 > 0 Y num_2 < 8  Entonces
			swichtEspecialidad <- Verdadero;
			datosPacientes[numeroPaciente,5] <- especialidad[num_2 - 1];
		FinSi
		
		
		Si swichtEspecialidad = Falso Entonces
			Escribir "Debe ingresar una opción válida";
			Escribir "             Especialidades:";
			Escribir "             1)Cardiología";
			Escribir "			    2)Traumatología";
			Escribir "			    3)Odontologia";
			Escribir "			    4)Pediatría";
			Escribir "			    5)Clínica";
			Escribir "			    6)Radiología";
			Escribir "			    7)Dermatología";
			Escribir "";
			Escribir "       Ingrese una opción: " Sin Saltar;
			Leer num_2;
			Limpiar Pantalla;
		FinSi
		
	FinMientras
	
	
	numeroPaciente <- numeroPaciente + 1;
	Limpiar Pantalla;
	Escribir"";
	Escribir"";
	Escribir"";
	Escribir"                    El paciente fue cargado exitosamente.  ";
	Escribir"";
	Escribir"                           1) Volver al menú: " Sin Saltar;
	Leer num_1;
	Mientras num_1 <> 1 Hacer
		Limpiar Pantalla;
		Escribir"";
		Escribir"";
		Escribir"";
		Escribir"                    El paciente fue cargado exitosamente.  ";
		Escribir"";
		Escribir"                           1) Volver al menú: " Sin Saltar;
		Leer num_1;
	FinMientras
	
	Limpiar Pantalla;
FinSubProceso



SubProceso buscar(datosPacientes,idPaciente)
	Definir dni,paciente Como Entero;
	Definir i,j,num_1,num_2 como Entero;
	Definir swichtBuscar Como Logico;
	
	swichtBuscar <- Falso;
	Mientras swichtBuscar = Falso Hacer
		Limpiar Pantalla;
		Escribir "Ingrese un DNI: " Sin Saltar;
		leer dni;
		
		
		paciente <- 0;
		Para i <- 0 Hasta 998 Hacer
			Si datosPacientes[i,6] = ConvertirATexto(dni) Entonces
				
				paciente <- i;
				swichtBuscar <- Verdadero;
				imprimirDatos(datosPacientes,swichtBuscar,paciente);
		
			FinSi
		FinPara
		
		
		Si swichtBuscar = Falso Entonces
			Limpiar Pantalla;
			Escribir "No se encontró ningún paciente que concuerde con los datos ingresados";
			Escribir "";
			Escribir "    1) Buscar paciente";
			Escribir "    2) Volver al menu";
			Escribir "    Ingrese una opcion: " Sin Saltar;
			Leer num_2;
			Si num_2 = 2 Entonces
				swichtBuscar <- Verdadero;
			FinSi
		FinSi
		Limpiar Pantalla;
	FinMientras
	
	
	
FinSubProceso



SubProceso imprimirDatos(datosPacientes,swichtBuscar,paciente)
	Definir num_1 Como Entero;
	
	Limpiar Pantalla;
	Escribir "";
	Escribir "";
	Escribir "";
	Escribir "                         ID: 00" , (paciente + 1);
	Escribir "                         Nombre: " ,datosPacientes[paciente,1];
	Escribir "                         Apellido: " ,datosPacientes[paciente,2];
	Escribir "                         DNI: " ,datosPacientes[paciente,6];
	Escribir "                         Edad: " ,datosPacientes[paciente,3];
	Escribir "                         Tipo de sangre: " ,datosPacientes[paciente,4];
	Escribir "                         Especialidad requerida: " ,datosPacientes[paciente,5];
	Escribir "";
	Escribir "";
	Escribir "                         1) Volver al menu: " Sin Saltar ;
		
	Leer num_1;
	Mientras  num_1 <> 1 Hacer
		Limpiar Pantalla;
		Escribir "";
		Escribir "";
		Escribir "";
		Escribir "                         Ingrese una opcion correcta";
		Escribir "                         1) Volver al menu: " Sin Saltar;
			
		Leer num_1;
	FinMientras
	
	Limpiar Pantalla;
FinSubProceso



SubProceso modificar
	
FinSubProceso



SubProceso eliminar
	
FinSubProceso


// Este es el Proceso principal.

Proceso Hospital
	menu();
FinProceso


