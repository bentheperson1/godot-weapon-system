extends Node2D


var weapons = [] # Create a new array to store all the weapons
var weapon = 0 # Current weapon
var weapon_recoil = 0 # Weapon recoil
var weapon_recoil_push = 0 # Weapon recoil push amount
var weapon_projectile # What the weapon will fire
var weapon_damage = 0 # How much damage the weapon will deal
var weapon_firepoint = 0 # Offset object for where the bullet will spawn
var weapon_cooldown = 0 # Time in frames between each shot
var weapon_bulletspeed = 0 # Speed of bullet
var weapon_automatic = false # Whether the weapon is automatic or not
var weapon_ammo = 0 # Amount of ammo in the weapon

func new_weapon(index, recoil, recoil_push, damage, projectile, 
firepoint, cooldown, bulletspeed, automatic,ammo, text):
	weapons[index] = { # Create a new dictionary containing the weapon info
		"recoil": recoil,
		"recoil_push": recoil_push,
		"damage": damage,
		"projectile": projectile,
		"firepoint": firepoint,
		"cooldown": cooldown,
		"bulletspeed": bulletspeed,
		"automatic": automatic,
		"ammo": ammo,
		"text": text
	}

func change_weapon(index):
	weapon = index
	weapon_recoil = weapons[index]["recoil"]
	weapon_recoil_push = weapons[index]["recoil_push"]
	weapon_damage = weapons[index]["damage"]
	weapon_projectile = weapons[index]["projectile"]
	weapon_firepoint = weapons[index]["firepoint"]
	weapon_bulletspeed = weapons[index]["bulletspeed"]
	weapon_automatic = weapons[index]["automatic"]
	weapon_ammo = weapons[index]["ammo"]
	weapon_cooldown = weapons[index]["cooldown"]

func _ready():
	weapons.resize(2) # change this number to however many weapons you have
