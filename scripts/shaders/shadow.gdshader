shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_enable, filter_nearest;
uniform float shadow_darkness = 0.6;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 c = textureLod(screen_texture, SCREEN_UV, 0.0).rgba;
	c.r = c.r*shadow_darkness;
	c.g = c.g*shadow_darkness;
	c.b = c.b*shadow_darkness;
	
	COLOR = c;
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}