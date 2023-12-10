extends Node

signal tick

@export var ticks_per_second := 1.0

var tick_rate := 1.0/ticks_per_second
var tick_counter := 0.0
var seconds := 0.0
var minutes := 0.0
var days = 1
var paused = true

const FULLDAYCYCLE = 24

func _ready():
	start()

func start():
	paused = false

func stop():
	paused = true

func _process(delta):
	if paused:
		return
	tick_counter += delta
	if tick_counter >= tick_rate:
		seconds += 1
		tick_counter = 0
		
	if seconds >= 60:
		minutes += 1
		seconds = 0.0
		
	if minutes >= 24:
		days += 1
		minutes = 0.0
