var screensize
var rate

func _ready():
	set_process(true)
	screensize = get_viewport_rect().size
	rate = -25

func _process(delta):
	var left_margin = self.get_margin(MARGIN_LEFT)
	if(left_margin + self.get_rect().size.x + 1 < screensize.x && rate < 0):
		rate = rate * -1
	if(left_margin > -1 && rate > 0):
		rate = rate * -1
	self.set_margin(MARGIN_LEFT, left_margin + (rate * delta))
