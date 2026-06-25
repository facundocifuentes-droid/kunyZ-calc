# test_calc.gd
extends Node

# Tests de unidad sobre realizar_operacion()

func test_suma() -> void:
	 var calc = $Calculadora
	 calc.numero1 = 2
	 calc.numero2 = 3
	 calc.realizar_operacion("sumar")
	 assert(calc.resultado == 5, "2 + 3 debería ser 5")
	 print("✅ test_suma pasado")

func test_suma_negativos() -> void:
	 var calc = $Calculadora
	 calc.numero1 = -5
	 calc.numero2 = -3
	 calc.realizar_operacion("sumar")
	 assert(calc.resultado == -8, "-5 + (-3) debería ser -8") # L2-11
	 print("✅ test_suma_negativos pasado")

func test_resta() -> void:
	 var calc = $Calculadora
	 calc.numero1 = 10
	 calc.numero2 = 4
	 calc.realizar_operacion("restar")
	 assert(calc.resultado == 6, "10 - 4 debería ser 6")
	 print("✅ test_resta pasado")

func test_multiplicacion() -> void:
	 var calc = $Calculadora
	 calc.numero1 = 7
	 calc.numero2 = 3
	 calc.realizar_operacion("multiplicar")
	 assert(calc.resultado == 21, "7 * 3 debería ser 21")
	 print("✅ test_multiplicacion pasado")

func test_division_entera() -> void:
	 var calc = $Calculadora
	 calc.numero1 = 15
	 calc.numero2 = 4
	 calc.realizar_operacion("dividir")
	 assert(calc.resultado == 3, "15 / 4 debería ser 3 (entero)") # RQ-L2-12
	 print("✅ test_division_entera pasado")

func test_division_por_cero() -> void:
	 var calc = $Calculadora
	 calc.numero1 = 8
	 calc.numero2 = 0
	 calc.realizar_operacion("dividir")
	 # La función setea el display con "OPCIÓN ILEGAL", no toca resultado
	 assert(calc.res.get_text() == "OPCIÓN ILEGAL", "8 / 0 debe mostrar 'OPCIÓN ILEGAL'") # RQ-L2-05
	 print("✅ test_division_por_cero pasado")

# Tests de sistema (simulando clicks en UI)

func test_suma_ui() -> void:
	 var calc = $Calculadora
	 calc._on_BorrarTodo_pressed()
	 calc._on_5_pressed() # display: "5"
	 calc._on_suma_pressed() # numero1=5, display: "+"
	 calc._on_3_pressed() # display: "+3"
	 calc._on_calcular_pressed() # resultado = 5+3 = 8, display: "8"
	 assert(calc.res.get_text() == "8", "5+3= debe mostrar 8") # RQ-L2-01
	 print("✅ test_suma_ui pasado")

func test_resta_ui() -> void:
	 var calc = $Calculadora
	 calc._on_BorrarTodo_pressed()
	 calc._on_1_pressed()
	 calc._on_0_pressed() # display: "10"
	 calc._on_resta_pressed() # numero1=10, display: "-"
	 calc._on_4_pressed() # display: "-4"
	 calc._on_calcular_pressed() # resultado = 10-4 = 6, display: "6"
	 assert(calc.res.get_text() == "6", "10-4= debe mostrar 6") # RQ-L2-02
	 print("✅ test_resta_ui pasado")

func test_multiplicacion_ui() -> void:
	 var calc = $Calculadora
	 calc._on_BorrarTodo_pressed()
	 calc._on_7_pressed() # display: "7"
	 calc._on_mult_pressed() # numero1=7, display: "X"
	 calc._on_3_pressed() # display: "X3"
	 calc._on_calcular_pressed() # resultado = 7*3 = 21, display: "21"
	 assert(calc.res.get_text() == "21", "7X3= debe mostrar 21") # RQ-L2-03
	 print("✅ test_multiplicacion_ui pasado")

func test_division_ui() -> void:
	 var calc = $Calculadora
	 calc._on_BorrarTodo_pressed()
	 calc._on_1_pressed()
	 calc._on_5_pressed() # display: "15"
	 calc._on_dividir_pressed() # numero1=15, display: "/"
	 calc._on_4_pressed() # display: "/4"
	 calc._on_calcular_pressed() # resultado = 15/4 = 3, display: "3"
	 assert(calc.res.get_text() == "3", "15/4= debe mostrar 3") # RQ-L2-04
	 print("✅ test_division_ui pasado")

func test_division_por_cero_ui() -> void:
	 var calc = $Calculadora
	 calc._on_BorrarTodo_pressed()
	 calc._on_8_pressed() # display: "8"
	 calc._on_dividir_pressed() # numero1=8, display: "/"
	 calc._on_0_pressed() # display: "/0"
	 calc._on_calcular_pressed() # numero2=0 → "OPCIÓN ILEGAL"
	 assert(calc.res.get_text() == "OPCIÓN ILEGAL", "8/0= debe mostrar 'OPCIÓN ILEGAL'") # RQ-L2-05
	 print("✅ test_division_por_cero_ui pasado")

func test_borrar_todo() -> void:
	 var calc = $Calculadora
	 calc._on_5_pressed()
	 calc._on_suma_pressed()
	 calc._on_3_pressed()
	 calc._on_BorrarTodo_pressed()
	 assert(calc.res.get_text() == "", "Después de C el display debe estar vacío") # RQ-L2-06
	 assert(calc.numero1 == null, "numero1 debe ser null")
	 assert(calc.numero2 == null, "numero2 debe ser null")
	 print("✅ test_borrar_todo pasado")

func test_boton_00() -> void:
	 var calc = $Calculadora
	 calc._on_BorrarTodo_pressed()
	 calc._on_00_pressed()
	 assert(calc.res.get_text() == "00", "Botón 00 debe concatenar '00'") # RQ-L2-10
	 print("✅ test_boton_00 pasado")

func test_digitos_0_al_9() -> void:
	 var calc = $Calculadora
	 calc._on_BorrarTodo_pressed()
	 calc._on_0_pressed()
	 calc._on_1_pressed()
	 calc._on_2_pressed()
	 calc._on_3_pressed()
	 calc._on_4_pressed()
	 calc._on_5_pressed()
	 calc._on_6_pressed()
	 calc._on_7_pressed()
	 calc._on_8_pressed()
	 calc._on_9_pressed()
	 assert(calc.res.get_text() == "0123456789", "Los dígitos deben concatenarse en orden") # RQ-L2-09
	 print("✅ test_digitos_0_al_9 pasado")
