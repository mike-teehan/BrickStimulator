
extends Sprite

var region
var bricklayer
var texture_width
var rate
var vel

func _ready():
	set_fixed_process(true)
	bricklayer = get_node("../BrickLayer")
	texture_width = get_texture().get_width()
	rate = 150

func _fixed_process(delta):
	region = get_region_rect()
	if(region.pos.x + region.size.width + 1 >= texture_width && rate > 0):
		rate = rate * -1 # pan lefy
		nudge_bricks(rate * -1)
	if(region.pos.x - 1 <= 0 && rate < 0):
		rate = rate * -1 # pan right
		nudge_bricks(rate * -1)
	set_region_rect(Rect2(Vector2(region.pos.x + (rate * delta), region.pos.y), Vector2(region.size.width, region.size.height)))

func nudge_bricks(impulse):
	for b in bricklayer.get_children():
		vel = b.get_linear_velocity()
		b.set_linear_velocity(Vector2(vel.x + impulse, vel.y))
