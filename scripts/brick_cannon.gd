var timer
var screensize
var nubrick
var mousedown

func _ready():
	set_fixed_process(true)
	timer = 0
	mousedown = false
	screensize = get_viewport_rect().size
	randomize()

func _fixed_process(delta):
	explode_bricks()
	if(timer > 0.5):
		timer = 0
		fire_brick()
		prune_projectiles()
	else:
		timer = timer + delta

func fire_brick():
	var bx = rand_range(0, screensize.x)
	var dir = 1
	if(bx > screensize.x / 2):
		dir = -1
		bx = bx + 150
	else:
		bx = bx - 150
	var xvel = rand_range(0, 250) * dir
	var yvel = rand_range(300, 450) * -1
	var angv = rand_range(0, 7)
	var objtype = rand_range(0, 50)
	if(objtype <= 1):
		nubrick = preload("res://scene/chair.xml").instance()
	elif(objtype <= 2):
		nubrick = preload("res://scene/ccv.xml").instance()
	else:
		nubrick = preload("res://scene/brick.xml").instance()
	nubrick.set_linear_velocity(Vector2(xvel, yvel))
	nubrick.set_pos(Vector2(bx, screensize.y + 20))
	nubrick.set_angular_velocity(angv)
	nubrick.set_angular_damp(0)
	self.add_child(nubrick)

func prune_projectiles():
	for b in self.get_children():
		if(b.get_pos().y > screensize.y + 20):
			remove_brick(b)

func explode_bricks():
	for b in self.get_children():
		if(b.has_meta("explode")):
			var met = b.get_meta("explode")
			if(met == "brick"):
				explode_brick(b, preload("res://scene/explosion.xml").instance())
			elif(met == "ccv"):
				explode_brick(b, preload("res://scene/ccv_explosion.xml").instance())

func explode_brick(brick, explosion):
				explosion.set_linear_velocity(brick.get_linear_velocity())
				explosion.set_angular_velocity(brick.get_angular_velocity())
				explosion.set_pos(brick.get_pos())
				explosion.get_child(0).set_emitting(true)
				self.add_child(explosion)
				remove_brick(brick)
	
func remove_brick(brick):
	self.remove_child(brick)
	brick.free()

func _on_StartButton_pressed():
	fire_brick()
	fire_brick()
	fire_brick()
	fire_brick()
	fire_brick()
	fire_brick()
	fire_brick()
	fire_brick()
	fire_brick()
	fire_brick()
