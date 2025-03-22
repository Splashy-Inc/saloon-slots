extends Sprite2D

enum Type {
	COWBOY,
	JELLY,
	SNAIL,
	CACTUS,
	SAW,
	VENT,
	TOOTH,
	CLAW,
	CLAM,
	SPLORSH,
}

var texture_map := {
	Type.COWBOY: load("res://ASSETS/Icons/Icon1CowboyHat.png"),
	Type.JELLY: load("res://ASSETS/Icons/Icon2Jellyfish.png"),
	Type.SNAIL: load("res://ASSETS/Icons/Icon3Snail.png"),
	Type.CACTUS: load("res://ASSETS/Icons/Icon4Cactus.png"),
	Type.SAW: load("res://ASSETS/Icons/Icon5Saw.png"),
	Type.VENT: load("res://ASSETS/Icons/Icon6ThermalVent.png"),
	Type.TOOTH: load("res://ASSETS/Icons/Icon7SharkTooth.png"),
	Type.CLAW: load("res://ASSETS/Icons/Icon8Claw.png"),
	Type.CLAM: load("res://ASSETS/Icons/Icon9Clam.png"),
	Type.SPLORSH: load("res://ASSETS/Icons/Icon10Splorsh.png"),
}

@export var type: Type

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = texture_map[type]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(self, global_position)
	pass
