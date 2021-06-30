extends Sprite

var weapon_timer = 0

var Bullet = preload("res://Bullet.tscn")
var Bullet2 = preload("res://Bullet2.tscn")

func _ready():
	WeaponSystem.new_weapon(0,0,0,-1,0,0,0,0,false,0,"") # Nothing
	WeaponSystem.new_weapon(1,10,2,0,Bullet,$FirePoint,6,5,true,INF,"") # Basic minigun style weapon
	WeaponSystem.new_weapon(1,10,2,0,Bullet2,$FirePoint,24,5,true,INF,"") # Basic cannon style weapon
	WeaponSystem.change_weapon(1) # Change current weapon to index 1 (The minigun)

func shoot():
	var roc = WeaponSystem.weapon_projectile.instance()
	get_tree().get_root().add_child(roc)
	roc.global_position = WeaponSystem.weapon_firepoint.global_position
	var dir = (get_global_mouse_position() - global_position).normalized()
	roc.global_rotation = dir.angle() + PI / 2.0
	roc.direction = dir

func _physics_process(delta):
	look_at(get_global_mouse_position())
	
	if WeaponSystem.weapon_automatic:
		weapon_timer -= 1
		if Input.is_action_pressed("fire") and weapon_timer <= 0:
			shoot()
			weapon_timer = WeaponSystem.weapon_cooldown
	else:
		if Input.is_action_just_pressed("fire"):
			shoot()
