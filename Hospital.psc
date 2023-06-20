
// Este subproceso imprime una interfaz y permite al usuario elegir que función utilizar
SubProceso  menu
	// En esta variable (num_1) guardaremos el numero ingresado por el usuario
	Definir i Como Entero;
	// Definimos una variable (swicht) para usar como condicion de un ciclo mientras
	Definir swicht Como Logico;
	// Definimos una variable (numeroPaciente) qur usaremos para mantener un conteo de los pacientes ingresados
	Definir numeroPaciente como Entero;
	// Definimos una variable (datosPacientes), será una matriz para guardar datos del tipo Cadena
	Definir datosPacientes,opcion_1 como Cadena;
	// Le damos un tamaño a la matriz, las columnas representaran los tipos de datos y cada fila a un paciente
	Dimension datosPacientes[999,7];
	
	// Usaremos este ciclo para limpiar cada fila de la columna "DNI"
	Para i <- 0 Hasta 998 Hacer
		datosPacientes[i,6] <- "";
	FinPara
	
	// Inicializamos la variable (númeroPaciente) con valor cero
	numeroPaciente <- 0;
	// Inicializamos la variable (swicht) como Falsa
	swicht <- Falso;
	
	// Mientras el usuario no ingrese la opción terminar se imprimirá el menu
	Mientras swicht = Falso Hacer
		Limpiar Pantalla;
		Escribir "";
		Escribir "                              ****************    ";
		Escribir "                              SISTEMA HOSPITAL    ";
		Escribir "                              ****************    ";
		Escribir "";
		Escribir "                           1) Ingresar paciente";
		Escribir "                           2) Buscar paciente";
		Escribir "                           3) Modificar paciente";
		Escribir "                           4) Eliminar paciente";
		Escribir "                           5) Salir";
		Escribir "";
		Escribir "                             Elija una opción: " Sin Saltar;
		leer opcion_1;
		// Si el número ingresado es no es válido
		Si opcion_1 <> "1" Y opcion_1 <> "2" Y opcion_1 <> "3" Y opcion_1 <> "4" Y opcion_1 <> "5" Entonces
			// Se solicita al usuario reingresar un número
			Limpiar Pantalla;
			Escribir "";
			Escribir "                              ****************    ";
			Escribir "                              SISTEMA HOSPITAL    ";
			Escribir "                              ****************    ";
			Escribir "";
			Escribir "";
			Escribir "                          Ingrese una opción válida.";
			Escribir "                    Digite cualquier tecla para continuar: >  " Sin Saltar;
			Esperar Tecla;
		Sino
			// Si ingresa 1)
			Si opcion_1 = "1" Entonces
				// Se llama el subproceso ingresar
				ingresar(datosPacientes,numeroPaciente);
			SiNo
				// Si ingresa 2)
				Si opcion_1 = "2" Entonces
					// Se llama el subproceso buscar
					buscar(datosPacientes);
				SiNo
					// Si ingresa 3
					Si opcion_1 = "3" Entonces
						// Se llama el subproceso modificar
						modificar(datosPacientes);
					SiNo
						Si opcion_1 = "4" Entonces
							// Se llama el subproceso eliminar
							Eliminar(datosPacientes);
						SiNo
							Si opcion_1 = "5" Entonces
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

// Esta función recibe una cadena y comprueba si cada caracter es un número, si todos son números, retorna Verdadero
Funcion esNumero <- validarNumero(num)
	Definir i,largo Como Entero;
	Definir c Como Cadena;
	Definir esNumero Como Logico;
	
	largo <- Longitud(num);
	esNumero <- Verdadero;
	
	// Itera por cada caracter de la cadena y lo compara con los números del 0 al 9
	Para i <- 0 Hasta largo - 1 Hacer
		c <- Subcadena(num,i,i);
		Si c <> "0" Y c <> "1" Y c <> "2" Y c <> "3" Y c <> "4" Y c <> "5" Y c <> "6" Y c <> "7" Y c <> "8" Y c <> "9" Entonces
			esNumero <- Falso;
		FinSi
	FinPara
	
	
FinFuncion

// Esta función recibe una cadena y comprueba si cada caracter es una letra, si todos son letras, retorna Verdadero
Funcion esLetra <- validarLetra(letra)
	Definir i,largo Como Entero;
	Definir c Como Cadena;
	Definir esLetra Como Logico;
	
	largo <- Longitud(letra);
	esLetra <- Verdadero;
	
	// Convierte la cadena a minúsculas
	letra <- Minusculas(letra);
	
	// Itera por cada caracter de la cadena y lo compara con las lestras del abcedario.
	Para i <- 0 Hasta largo - 1 Hacer
		c <- Subcadena(letra,i,i);
		Si c <> "a" Y c <> "b" Y c <> "c" Y c <> "d" Y c <> "e" Y c <> "f" Y c <> "g" Y c <> "h" Y c <> "i" Y c <> "j" Entonces
			Si c <> "k" Y c <> "l" Y c <> "m" Y c <> "n" Y c <> "o" Y c <> "p" Y c <> "q" Y c <> "r" Y c <> "s" Y c <> "t" Entonces
				Si c <> "u" Y c <> "v" Y c <> "w" Y c <> "x" Y c <> "y" Y c <> "z" Y c <> "ñ"  Entonces
					esLetra <- Falso;
				FinSi
			FinSi
		FinSi
	FinPara
	
FinFuncion

// Este subproceso imprime el título de esta parte del programa
SubProceso  tituloIngreso 
	Escribir "";
	Escribir "                              ****************    ";
	Escribir "                              INGRESO DE DATOS    ";
	Escribir "                              ****************    ";
	Escribir "";
FinSubProceso

// El subproceso ingresar recibe la matriz de datos del paciente y el número de paciente por referencia
SubProceso ingresar(datosPacientes Por Referencia,numeroPaciente Por Referencia )
	
	// En esta variable (num_1) guardaremos el numero ingresado por el usuario
	Definir num_1,i,long,contador Como Entero;
	// Se define un arreglo para guardar los diferentes tipos de sangre, otro para guardar dni, edad,,opciones del menú, nombre y apellido
	Definir tipoSangre,edad,dni,opcion,nombre,apellido como Cadena;
	// Estas variables nos permiten validar los datos 
	Definir esNumero,esLetra Como Logico;
	// Definimos varias variables para usar como condicion de un ciclo mientras
	Definir swichtSangre,swichtEspecialidad,swichtDni,swichtDni_2,swichtEdad Como Logico;
	// Se define un arreglo para guardar los diferentes tipos de sangre
	Definir especialidad como Cadena;
	
	// En el arreglo (tipoSangre) se guardaran los tips de sangre posibles
	Dimension tipoSangre[8];
	tipoSangre[0] <- "a+";
	tipoSangre[1] <- "b+";
	tipoSangre[2] <- "ab+";
	tipoSangre[3] <- "0+";
	tipoSangre[4] <- "a-";
	tipoSangre[5] <- "b-";
	tipoSangre[6] <- "ab-";
	tipoSangre[7] <- "0-";
	
	// En el arreglo (especialidad) se guardaran las especialidades disponibles
	Dimension especialidad[7];
	especialidad[0] <- "Cardiología";
	especialidad[1] <- "Traumatología";
	especialidad[2] <- "Odontología";
	especialidad[3] <- "Pediatría";
	especialidad[4] <- "Clínica";
	especialidad[5] <- "Radiología";
	especialidad[6] <- "Dermatología";
	
	
	Limpiar Pantalla;

	// En cada fila de la primer columna se almacenará el número de ID de cada paciente ingresado
	// Usamos la función ConvertirATexto() en nuestra entero (numeroPaciente)
	datosPacientes[numeroPaciente,0] <- ConvertirATexto(numeroPaciente);
	
	// Se utiliza esta función para impirmir el título
	tituloIngreso();
	// Se le solicita al usuario que ingrese su nombre
	Escribir "";
	Escribir "                          Nombre: " Sin Saltar;
	// Se almacenara el nombre en uan variable
	Leer nombre;
	
	// Se valida que solo contenga letras
	esLetra <- validarLetra(nombre);
	
	// Mientras esto sea falso
	Mientras esLetra = Falso Hacer
		// Se solicita la usuario vuelva a ingresar el dato
		Limpiar Pantalla;
		tituloIngreso();
		Escribir "";
		Escribir "                      Debe ingresar un Nombre válido (!)";
		Escribir "";
		Escribir "";
		Escribir "                              Nombre: " Sin Saltar;
		Leer nombre;
		Limpiar Pantalla;
		esLetra <- validarLetra(nombre);
		
		
	FinMientras
	
	// Se guarda el dato validado en la columna nombre de la matriz 
	datosPacientes[numeroPaciente,1] <- nombre;
	
	Limpiar Pantalla;
	
	// Se utiliza esta función para impirmir el título
	tituloIngreso();
	// Se le solicita al usuario que ingrese su nombre
	Escribir "";
	Escribir "                          Apellido: " Sin Saltar;
	// Se almacenara el nombre en la segunda columna
	Leer apellido;
	
	// Se valida que solo contenga letras
	esLetra <- validarLetra(apellido);
	
	// Mientras esto sea falso
	Mientras esLetra = Falso Hacer
		// Se solicita la usuario vuelva a ingresar el dato
		Limpiar Pantalla;
		tituloIngreso();
		Escribir "";
		Escribir "                      Debe ingresar un Apellido válido (!)";
		Escribir "";
		Escribir "";
		Escribir "                                Apellido: " Sin Saltar;
		Leer apellido;
		Limpiar Pantalla;
		esLetra <- validarLetra(apellido);
		
		
	FinMientras
	
	// Se guarda el dato validado en la columna nombre de la matriz 
	datosPacientes[numeroPaciente,2] <- apellido;
	Limpiar Pantalla;
	
	// Se utiliza esta función para impirmir el título
	tituloIngreso();
	// Se le solicita al usuario que ingrese su DNI
	Escribir "";
	Escribir "                          DNI: " Sin Saltar;
	// Se almacenara el DNI en una variable dni
	// Se utilizará esta variable para comprobar que le DNI ingresado sea válido antes de guardarlo en la matriz de datos
	Leer dni;
	Limpiar Pantalla;
	
	// Luego se utiliza un ciclo mientras para verificar que se haya ingresado un DNI válido
	contador <- 0;
	swichtDni_2 <- Falso;
	// Mientras (swichtDni_2) sea falso
	Mientras swichtDni_2 = Falso Hacer
		// Itera por cada fila de la columna seis DNI 
		Para i <- 0 Hasta 998 Hacer
			// Si el DNI ingresado es igual al DNI almacenado en una de las filas de la columna seis DNI
			Si datosPacientes[i,6] = dni Entonces
				// Terminamos el ciclo Para
				i <- 998;
				// Solicitamos que se ingrese otro DNI
				tituloIngreso();
				Escribir "";
				Escribir "                     El DNI ingresado ya esta en uso (!)";
				Escribir "";
				Escribir "";
				Escribir "                            Ingrese otro DNI: " Sin Saltar;
				Leer dni;
				Limpiar Pantalla;
			SiNo
				// Si el DNI ingresado no es igual al DNI almacenado sumamos mas uno al contador
				contador <- contador + 1;
			FinSi
		FinPara
		// Si el DNI ingresado es distinto de todos los DNI almacenados
		Si contador = 999 Entonces
			// La variable (swichtDni_2) se establece como verdadera y se sale del ciclo Mientras
			swichtDni_2 <- Verdadero;
		FinSi
		
	FinMientras
	
	
	swichtDni <- Falso;
	// Mientras (swichtDni) sea falso
	Mientras swichtDni = Falso  Hacer
		// La variable (long) es igual a la longitud del DNI ingresado
		long <- Longitud(dni);
		// Se valida que la cadena (dni) solo contenga números
		esNumero <- validarNumero(dni);
		// Si el DNI ingresado tiene entre 6 y 8 dígitos y solo números
		Si long > 5 Y long < 9 Y esNumero = Verdadero Entonces
			// La variable (swichtDni) se establece como verdadera y se sale del ciclo Mientras
			swichtDni <- Verdadero;
		SiNo
			// Sino,se solicita al usuario que ingrese un DNI válido
			tituloIngreso();
			Escribir "";
			Escribir "                      Debe ingresar un DNI válido (!)";
			Escribir "";
			Escribir "";
			Escribir "                      Ingrese el DNI del paciente: " Sin Saltar;
			Leer dni;
			Limpiar Pantalla;
		FinSi
		
	FinMientras
	
	// Una vez que el DNI esta validado, se almacena en la séptima columna de la matriz convertida de nuevo a texto
	datosPacientes[numeroPaciente,6] <- dni;
	
	swichtEdad <- Falso;
	Mientras swichtEdad = Falso Hacer
		
		Limpiar Pantalla;
		// Se utiliza esta función para impirmir el título
		tituloIngreso();
		Escribir "";
		// Se le solicita al usuario que ingrese su edad
		Escribir "                     Ingrese la edad del paciente: " Sin Saltar;
		// Se almacenara la edad en la cuarta columna de la matriz
		Leer edad;
		// Se valida que la cadena (edad) solo contenga números
		esNumero <- validarNumero(edad);
		Si esNumero = Falso O ( Longitud(edad) < 1 O Longitud(edad) > 3 ) Entonces
			Limpiar Pantalla;
			tituloIngreso();
			Escribir "";
			Escribir "                      Debe ingresar una edad válida (!)";
			Escribir "";
			Escribir "";
			Escribir "                  Digite cualquier tecla para continuar: >  " Sin Saltar;
			Esperar Tecla;
			Limpiar Pantalla;
		SiNo
			datosPacientes[numeroPaciente,3] <- edad;
			swichtEdad <- Verdadero;
		FinSi
		
	FinMientras
	
	Limpiar Pantalla;
	
	// Se utiliza esta función para impirmir el título
	tituloIngreso();
	Escribir "";
	// Se le solicita al usuario que ingrese su tipo de sangre
	Escribir "                 Ingrese tipo de sangre del paciente: " Sin Saltar;
	// Se almacenara el tipo de sangre en la quinta columna de la matriz
	Leer datosPacientes[numeroPaciente,4];
	Limpiar Pantalla;
	
	swichtSangre <- Falso;
	// Mientras el swicht sea falso
	Mientras swichtSangre = Falso Hacer
		// Itera por cada elemento de larreglo tipoSangre
		Para i <- 0 Hasta 7 Hacer
			// Si el tipo desangre ingresada coincide con los tipos válidos almacenados en el arreglo
			Si Minusculas(datosPacientes[numeroPaciente,4]) = tipoSangre[i] Entonces
				// El swicht se define como Verdadero par asalir del ciclo Mientras
				swichtSangre <- Verdadero;
			FinSi
		FinPara
		
		// Si el valor de swichtSangre no cambió, significa que el tipo de sangre no fue válido
		Si swichtSangre = Falso Entonces
			// Se solicita al usuario que ingrese un tipo de sangre válido
			tituloIngreso();
			Escribir "";
			Escribir "Debe ingresar un tipo de sangre válido (A+, B+, AB+, 0+, A-, B-, AB-, 0-)";
			Escribir "                Ingrese tipo de sangre del paciente: " Sin Saltar;
			// Se almacenara el tipo de sangre en la quinta columna de la matriz
			Leer datosPacientes[numeroPaciente,4];
			Limpiar Pantalla;
		FinSi
		
	FinMientras
	
	tituloIngreso();
	// Imprime una lista con las especialidades disponibles para atenderse
	Escribir "                     Especialidades:";
	Escribir "						1)Cardiología";
	Escribir "						2)Traumatología";
	Escribir "						3)Odontologia";
	Escribir "						4)Pediatría";
	Escribir "						5)Clínica";
	Escribir "						6)Radiología";
	Escribir "						7)Dermatología";
	Escribir "                           Ingrese una opción: " Sin Saltar;
	// Lee la opción ingresada en la variable (opcion)
	Leer opcion;
	Limpiar Pantalla;
	
	// Con este ciclo Mientras validaremos que se ingrese una opción válida (un número entero entre 1 y 7)
	swichtEspecialidad <- Falso;
	Mientras swichtEspecialidad = Falso Hacer
		
		esNumero <- validarNumero(opcion);
		// Si el número ingresado se encuentra entre 1 y 7
		Si  esNumero = Verdadero Y ConvertirANumero(opcion) > 0 Y ConvertirANumero(opcion) < 8 Entonces
			// Cambiamos el valor del swicht para salir del ciclo Mientras
			swichtEspecialidad <- Verdadero;
			// Se almacena el la especialidad elegida usando un arreglo con las epecialidades disponibles
			// Se almacenará en la sexta columna
			datosPacientes[numeroPaciente,5] <- especialidad[ConvertirANumero(opcion) - 1];
		// Si la opción ingresada es inválida
		SiNo
			// Solicita la usuario que igrese un opción válida
			tituloIngreso();
 			Escribir "                     Debe ingresar una opción válida (!)";
			Escribir "						1)Cardiología";
			Escribir "						2)Traumatología";
			Escribir "						3)Odontologia";
			Escribir "						4)Pediatría";
			Escribir "						5)Clínica";
			Escribir "						6)Radiología";
			Escribir "						7)Dermatología";
			Escribir "                           Ingrese una opción: " Sin Saltar;
			// Lee la opción ingresada en la variable (opcion)
			Leer opcion;
			Limpiar Pantalla;
		FinSi
		
	FinMientras
	
	// Una vez que se ingresaron todos los datos, se aumenta en uno el valor de ID de pacientes
	// De esta forma el próximo paciente que sea ingresado tendra un número diferente
	numeroPaciente <- numeroPaciente + 1;
	// Se imprime en pantalla la confirmación de ingreso de paciente para el usuario
	Limpiar Pantalla;
	Escribir"";
	Escribir"";
	Escribir"";
	Escribir"                    El paciente fue cargado exitosamente.  ";
	Escribir"";
	Escribir "                  Digite cualquier tecla para continuar: >  " Sin Saltar;
	Esperar Tecla;
	
	Limpiar Pantalla;
FinSubProceso

// Este subproceso imprime el título de esta parte del programa
SubProceso  tituloBuscar
	Limpiar Pantalla;
	Escribir "";
	Escribir "                              ****************    ";
	Escribir "                              BUSCAR PACIENTES    ";
	Escribir "                              ****************    ";
	Escribir "";
FinSubProceso

SubProceso buscar(datosPacientes)
	
	Definir swicht Como Logico;
	Definir opcion Como Cadena;
	
	swicht <- Falso;
	
	// Mientras no se ingrese una opción correcta
	Mientras swicht = Falso Hacer
		
		tituloBuscar();
		Escribir "";
		Escribir "                       1) Mostrar lista de Pacientes";
		Escribir "                       2) Buscar por DNI";
		Escribir "                       3) Volver al menú principal";
		Escribir "";
		Escribir "                           Digite una opción: " Sin Saltar;
		leer opcion;
		
		// Si el número ingresado es no es válido
		Si opcion <> "1" Y opcion <> "2" Y opcion <> "3"  Entonces
			// Se solicita la usuario que reingrese lqa opción 
			tituloBuscar();
			Escribir "";
			Escribir "                        Ingrese una opción válida. (!)";
			Escribir "";
			Escribir "                 Digite cualquier tecla para continuar: >  " Sin Saltar;
			Esperar Tecla;
		Sino
			// Si ingresa 1)
			Si opcion = "1" Entonces
				// Se llama al subproceso mostrarLista
				mostrarLista(datosPacientes);
			SiNo
				// Si ingresa 2)
				Si opcion = "2" Entonces
					// Se llama el subproceso buscar
					buscarDni(datosPacientes);
				SiNo
					// Si ingresa 3
					Si opcion = "3" Entonces
						// Retorna al menú
						swicht <- Verdadero;
						Limpiar Pantalla;
					FinSi
				FinSi
			FinSi
		FinSi
	FinMientras
	
FinSubProceso

// Este subproceso muestras uan lista de todos los pacientes y sus datos
SubProceso mostrarLista(datosPacientes)
	
	Definir dp Como Cadena;
	Dimension dp[7];
	Definir i,j Como Entero;
	
	// Imprime una interfaz
	Limpiar Pantalla;
	Escribir "+----------------------------------------------------------------------+";
	Escribir "|   Nombre     Apellido        Dni       Edad    AB0     Especialidad  |";    
 	Escribir "+----------------------------------------------------------------------+";
	
	// Itera por cada paciente de las lista
	Para i <- 0 Hasta 998 Hacer
		// Si hay un paciente cargado en la fila y no esta en blanco
		Si datosPacientes[i,6] <> "" Entonces
			
			// Se imprimen los datos de cada columna
			Para j <- 0 Hasta 6 Hacer
				dp[j] <- datosPacientes[i,j];
			FinPara
			
			Escribir "    ",dp[1],"      ",dp[2],"      ",dp[6],"     ",dp[3],"      ",dp[4],"     ",dp[5],"  ";    
			Escribir "+----------------------------------------------------------------------+";
		FinSi
	FinPara
	Escribir "";
	Escribir "";
	Escribir "Digite cualquier tecla para continuar: >  " Sin Saltar;
	Esperar Tecla;
	Limpiar Pantalla;
FinSubProceso

// Esta función permite buscar en la séptima columna de la matriz por DNI 
SubProceso buscarDni(datosPacientes)
	// Definimos una variable para almacenar el dni ingresado (dni)
	// Definimos una variable (paciente) pra mantener un conteo de cuantos datos fueron contrastados
	Definir paciente Como Entero;
	Definir i,j Como Entero;
	Definir dni,opcion_1 Como Cadena;
	// Definimos un swicht lógico 
	Definir swichtBuscar Como Logico;
	// Se inicializa como Falso
	swichtBuscar <- Falso;
	// Mientras se cumpla la condición 
	Mientras swichtBuscar = Falso Hacer
		// Se solicita al usuario que ingrese un DNI
		tituloBuscar();
		Escribir "";
		Escribir "                      Ingrese un DNI: " Sin Saltar;
		// Se almacena el dato ingresado en una variable (dni)
		leer dni;
		
		// Se inicializa la variable (paciente) en cero
		paciente <- 0;
		// Itera por la séptima columna DNI buscando coincidencias
		Para i <- 0 Hasta 998 Hacer
			// Si el dni ingresado covertido a texto es igual al DNI almacenado en la fila i
			Si datosPacientes[i,6] = dni Y dni <> "" Entonces
				// Se guarda el índice de la fila del paciente coincidente
				paciente <- i;
				//  Se cambia el swicht a Verdadero, para slair del ciclo Mientras
				swichtBuscar <- Verdadero;
				// Se llama a la funcion (imprimirDatos)
				imprimirDatos(datosPacientes,paciente);
		
			FinSi
		FinPara
		// Si no se encontro ninguna coincidencia
		Si swichtBuscar = Falso Entonces
			opcion_1 <- "";
			Mientras opcion_1 <> "1" Y opcion_1 <> "2" Hacer
				// Se le pregunta la usuario si desea hacer otra busqueda o volver al menú principal
				Limpiar Pantalla;
				Escribir "";
				Escribir "                           **************************";
				Escribir "                            No hay coincidencias (!) ";
				Escribir "                           **************************";
				Escribir "";
				Escribir "";
				Escribir "                             1) Buscar paciente";
				Escribir "                             2) Volver al menu";
				Escribir "";
				Escribir "                            Ingrese una opcion: " Sin Saltar;
				Leer opcion_1;
				Si opcion_1 = "2"Entonces
					swichtBuscar <- Verdadero;
				FinSi
			FinMientras
		FinSi
		Limpiar Pantalla;
	FinMientras
	
FinSubProceso


// Este subproceso imprime los datos del paciente correspondiente 
SubProceso imprimirDatos(datosPacientes,paciente)
	
	Limpiar Pantalla;
	Escribir "";
	Escribir "";
	Escribir "                            ID: 00" , (paciente + 1);
	Escribir "                            Nombre: " ,datosPacientes[paciente,1];
	Escribir "                            Apellido: " ,datosPacientes[paciente,2];
	Escribir "                            DNI: " ,datosPacientes[paciente,6];
	Escribir "                            Edad: " ,datosPacientes[paciente,3];
	Escribir "                            Tipo de sangre: " ,datosPacientes[paciente,4];
	Escribir "                            Especialidad requerida: " ,datosPacientes[paciente,5];
	Escribir "";
	Escribir "";
	Escribir "                      Digite cualquier tecla para continuar: >  " Sin Saltar;
	Esperar Tecla;
	Limpiar Pantalla;
	
FinSubProceso

// Este subproceso imprime el título de esta parte del programa
SubProceso  tituloMod
	Limpiar Pantalla;
	Escribir "";
	Escribir "                              ****************    ";
	Escribir "                              MODIFICAR  DATOS    ";
	Escribir "                              ****************    ";
	Escribir "";
FinSubProceso

// Este subproceso permite modificar los datos de un paciente
SubProceso modificar(datosPacientes Por Referencia)
	
	// Definimos una variable para almacenar el dni ingresado (dni)
	// Definimos variables (opcion) para guardar los opciones ingresadas por el usuario en los menús
	// Definimos una variable (paciente) para mantener un conteo de cuantos datos fueron contrastados
	Definir i,paciente Como Entero;
	Definir opcion_1,opcion_2,dni Como Cadena;
	Definir swichtModificar Como Logico;
	// Se inicializa como Falso
	swichtModificar <- Falso;
	// Mientras se cumpla la condición 
	Mientras swichtModificar = Falso Hacer
		// Se solicita al usuario que ingrese un DNI
		tituloMod();
		Escribir "";
		Escribir "                      Ingrese un DNI: " Sin Saltar;
		// Se almacena el dato ingresado en una variable (dni)
		leer dni;
		
		// Se inicializa la variable (paciente) en cero
		paciente <- 0;
		// Itera por la séptima columna DNI buscando coincidencias
		Para i <- 0 Hasta 998 Hacer
			// Si el dni ingresado covertido a texto es igual al DNI almacenado en la fila i
			Si datosPacientes[i,6] = dni Y datosPacientes[i,6] <> "" Entonces
				// Se guarda el índice de la fila del paciente coincidente
				paciente <- i;
				//  Se cambia el swicht a Verdadero, para salir del ciclo Mientras
				swichtModificar <- Verdadero;
				
				// Se muestran los datos del paciente y se pude confirmación para modificarlos al usuario
				Limpiar Pantalla;
				Escribir "";
				Escribir "";
				Escribir "                          ID: 00" , (paciente + 1);
				Escribir "                          Nombre: " ,datosPacientes[paciente,1];
				Escribir "                          Apellido: " ,datosPacientes[paciente,2];
				Escribir "                          DNI: " ,datosPacientes[paciente,6];
				Escribir "                          Edad: " ,datosPacientes[paciente,3];
				Escribir "                          Tipo de sangre: " ,datosPacientes[paciente,4];
				Escribir "                          Especialidad requerida: " ,datosPacientes[paciente,5];
				Escribir "";
				Escribir "                Confirme para reingresar los datos del paciente: ";
				Escribir "                         1) Modificar";
				Escribir "                         2) Volver al menú principal";
				Escribir "                         Ingrese una opción: " Sin Saltar;
				Leer opcion_1;
				
				// Con este ciclo mientras se verifica que el usuario ingrese una opción válida
				Mientras  opcion_1 <> "1" Y opcion_1 <> "2" Hacer
					Limpiar Pantalla;
					Escribir "";
					Escribir "";
					Escribir "";
					Escribir "                         Ingrese una opción correcta (!)";
					Escribir "";
					Escribir "                         	1) Modificar";
					Escribir "                         	2) Volver al menú principal";
					Escribir "                           Ingrese una opción: " Sin Saltar;
					Leer opcion_1;
				FinMientras
				
				Limpiar Pantalla;
				// Si el usuario confirma la modificación
				Si opcion_1 = "1" Entonces
					// Se llama al subproceso ingresar, para sobreescribir los datos viejos por los nuevos
					datosPacientes[paciente,6] <- "";
					ingresar(datosPacientes,paciente);
					// Se informa al usuario que el paciente fue modificado correctamente
					Limpiar Pantalla;
					
				FinSi
				
			FinSi
		FinPara
		
		// Si no se encontro ninguna coincidencia
		Si swichtModificar = Falso Entonces
			opcion_2 <- "";
			Mientras opcion_2 <> "1" Y opcion_2 <> "2" Hacer
				// Se le pregunta la usuario si desea hacer otra busqueda o volver al menú principal
				Limpiar Pantalla;
				Escribir "";
				Escribir "                           **************************";
				Escribir "                            No hay coincidencias (!) ";
				Escribir "                           **************************";
				Escribir "";
				Escribir "";
				Escribir "                             1) Buscar paciente";
				Escribir "                             2) Volver al menu";
				Escribir "";
				Escribir "                            Ingrese una opcion: " Sin Saltar;
				Leer opcion_2;
				Si opcion_2 = "2" Entonces
					swichtModificar <- Verdadero;
				FinSi
			FinMientras
		FinSi
		Limpiar Pantalla;
	FinMientras
	
FinSubProceso

// Este subproceso imprime el título de esta parte del programa
SubProceso  tituloEliminar
	Limpiar Pantalla;
	Escribir "";
	Escribir "                              **************    ";
	Escribir "                              ELIMINAR DATOS    ";
	Escribir "                              **************    ";
	Escribir "";
FinSubProceso

// Este subproceso elimina los datos del paciente correpondiente
SubProceso eliminar(datosPacientes Por Referencia)
	// Definimos una variable para almacenar el dni ingresado (dni)
	// Definimos variables (opcion) para guardar los opciones ingresadas por el usuario en los menús
	// Definimos una variable (paciente) pra mantener un conteo de cuantos datos fueron contrastados
	Definir i,paciente Como Entero;
	Definir dni,opcion_1,opcion_2 Como Cadena;
	Definir swichtEliminar Como Logico;
	// Se inicializa como Falso
	swichtEliminar <- Falso;
	// Mientras se cumpla la condición 
	Mientras swichtEliminar = Falso Hacer
		// Se solicita al usuario que ingrese un DNI
		tituloEliminar();
		Escribir "";
		Escribir "                      Ingrese un DNI: " Sin Saltar;
		// Se almacena el dato ingresado en una variable (dni)
		leer dni;
		
		// Se inicializa la variable (paciente) en cero
		paciente <- 0;
		// Itera por la séptima columna DNI buscando coincidencias
		Para i <- 0 Hasta 998 Hacer
			// Si el dni ingresado covertido a texto es igual al DNI almacenado en la fila i
			Si datosPacientes[i,6] = dni Y dni <> "" Entonces
				// Se guarda el índice de la fila del paciente coincidente
				paciente <- i;
				// Se muestran los datos del paciente y se pude confirmación para eliminarlo al usuario
				Limpiar Pantalla;
				Escribir "";
				Escribir "                           ID: 00" , (paciente + 1);
				Escribir "                           Nombre: " ,datosPacientes[paciente,1];
				Escribir "                           Apellido: " ,datosPacientes[paciente,2];
				Escribir "                           DNI: " ,datosPacientes[paciente,6];
				Escribir "                           Edad: " ,datosPacientes[paciente,3];
				Escribir "                           Tipo de sangre: " ,datosPacientes[paciente,4];
				Escribir "                           Especialidad requerida: " ,datosPacientes[paciente,5];
				Escribir "";
				Escribir "                          Confirme para eliminar el paciente: ";
				Escribir "                          1) Eliminar";
				Escribir "                          2) Volver al menú principal";
				Escribir "                          Ingrese una opción: " Sin Saltar;
				Leer opcion_1;
				
				// Con este ciclo mientras se verifica que el usuario ingrese una opción válida
				Mientras  opcion_1 <> "1" Y opcion_1 <> "2" Hacer
					Limpiar Pantalla;
					Escribir "";
					Escribir "";
					Escribir "";
					Escribir "                         Ingrese una opcion correcta (!)";
					Escribir "";
					Escribir "                         	1) Eliminar";
					Escribir "                         	2) Volver al menú principal";
					Escribir "                           Ingrese una opción: " Sin Saltar;
					Leer opcion_1;
				FinMientras
				
				Limpiar Pantalla;
				// Si el usuario confirma la eliminación
				Si opcion_1 = "1" Entonces
					// Itera por cada columna de la fila paciente
					Para i <- 0 Hasta 6 Hacer
						// Se borran los datos de cada columna
						datosPacientes[paciente,i] <- "";
					FinPara
					// Se informa al usuario que el paciente fue eliminado correctamente
					Limpiar Pantalla;
					Escribir"";
					Escribir"";
					Escribir"";
					Escribir"                    El paciente fue eliminado exitosamente.  ";
					Escribir"";
					Escribir"";
					Escribir"";
					Escribir "                 Digite cualquier tecla para continuar: >  " Sin Saltar;
					Esperar Tecla;
					swichtEliminar <- Verdadero;
					Limpiar Pantalla;
					
				SiNo
					Si opcion_1 = "2" Entonces
						swichtEliminar <- Verdadero;
					FinSi
				FinSi
				
			FinSi
		FinPara
		
		// Si no se encontro ninguna coincidencia
		Si swichtEliminar = Falso Entonces
			// Se le pregunta la usuario si desea hacer otra busqueda o volver al menú principal
			opcion_2 <- "";
			Mientras opcion_2 <> "1" Y opcion_2 <> "2" Hacer
				// Se le pregunta la usuario si desea hacer otra busqueda o volver al menú principal
				Limpiar Pantalla;
				Escribir "";
				Escribir "                           **************************";
				Escribir "                            No hay coincidencias (!) ";
				Escribir "                           **************************";
				Escribir "";
				Escribir "";
				Escribir "                             1) Buscar paciente";
				Escribir "                             2) Volver al menu";
				Escribir "";
				Escribir "                            Ingrese una opcion: " Sin Saltar;
				Leer opcion_2;
				Si opcion_2 = "2" Entonces
					swichtEliminar <- Verdadero;
				FinSi
			FinMientras
		FinSi
		Limpiar Pantalla;
	FinMientras
	
FinSubProceso


// Este es el Proceso principal.

Proceso Hospital
	menu();
FinProceso


