extends Control


# Declare member variables here. Examples:
var numero1 = null
var numero2 = null
var resultado = 0
var operacion = ""
onready var res = $Resultado


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BorrarTodo_pressed():
	numero1 = null
	numero2 = null
	res.set_text("")

func _on_suma_pressed():
	operacion = "sumar"
	numero1 = int(res.get_text())
	res.set_text("+")

func _on_calcular_pressed():
	realizar_operacion(operacion)

func realizar_operacion(op):
	numero2 = int(res.get_text())
	match op:
		"sumar":
			resultado = numero1 + numero2
			res.set_text(str(resultado))
		"restar":
			resultado = numero1 - numero2
			res.set_text(str(resultado))
		"dividir":
			if numero2 == 0:
				res.set_text("OPCIÓN ILEGAL")
			else:
				resultado = numero1 / numero2
				res.set_text(str(resultado))
		"multiplicar":
			resultado = numero1 * numero2
			res.set_text(str(resultado))

	numero1 = null
	numero2 = null

func _on_resta_pressed():
	operacion = "restar"
	numero1 = int(res.get_text())
	res.set_text("-")

func _on_1_pressed():
	res.set_text(res.get_text() + "1")


func _on_2_pressed():
	res.set_text(res.get_text() + "2")


func _on_3_pressed():
	res.set_text(res.get_text() + "3")


func _on_4_pressed():
	res.set_text(res.get_text() + "4")


func _on_5_pressed():
	res.set_text(res.get_text() + "5")


func _on_6_pressed():
	res.set_text(res.get_text() + "6")


func _on_7_pressed():
	res.set_text(res.get_text() + "7")


func _on_8_pressed():
	res.set_text(res.get_text() + "8")


func _on_9_pressed():
	res.set_text(res.get_text() + "9")


func _on_0_pressed():
	res.set_text(res.get_text() + "0")


func _on_mult_pressed():
	operacion = "multiplicar"
	numero1 = int(res.get_text())
	res.set_text("X")


func _on_dividir_pressed():
	operacion = "dividir"
	numero1 = int(res.get_text())
	res.set_text("/")


func _on_00_pressed():
	res.set_text(res.get_text() + "00")
