extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")
var dialogue = [
	"Welcome to the game! (Press E to continue)",
	"To win the game, you must shoot all 5 targets and then destroy the drone before you run out of time.",
	"Be careful! The drone can shoot and hurt you!",
	"You will have 1 minute. You ready? The game will start after you press E"
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue",self,"finished")

func _on_Area_body_entered(body):
	Dialogue.start_dialogue(dialogue)

func _on_Area_body_exited(body):
	Dialogue.hide_dialogue()

func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 5
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()
