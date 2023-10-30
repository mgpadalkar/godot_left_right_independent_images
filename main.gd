extends Node3D

var xr_interface: XRInterface

var img1 = load("res://icon.svg")
var img2 = load("res://OpenCV_logo_black.svg")

# Called when the node enters the scene tree for the first time.
func _ready():
	# pass # Replace with function body.
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialised successfully")
		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, please check if your headset is connected")
	# code for our shader
	shader_code()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func shader_code():
	# pass
	var my_shader = $XROrigin3D/MeshInstance3D.mesh.surface_get_material(0)
	my_shader.set_shader_parameter("texture_albedo1", img1)
	my_shader.set_shader_parameter("texture_albedo2", img2)
