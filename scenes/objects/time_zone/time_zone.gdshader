shader_type canvas_item;

uniform vec4 tint : source_color = vec4(0.5, 0.8, 1.0, 0.2);
uniform vec4 edge_color : source_color = vec4(0.7, 0.9, 1.0, 0.8);
uniform float edge_width = 6.0;
uniform float pulse_speed = 3.0;
uniform float outer_glow = 0.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 inner = min(UV, 1.0 - UV) / fwidth(UV) - outer_glow;
	float sd = min(inner.x, inner.y) > 0.0
		? min(inner.x, inner.y)
		: -length(min(inner, vec2(0.0)));
	float glow = sd > 0.0 ? 1.0 - smoothstep(0.0, max(edge_width, 0.001), sd) : 0.0;
	float pulse = 0.8 + 0.2 * sin(TIME * pulse_speed);
	float fill_alpha = sd > 0.0 ? 1.0 : 1.0 - smoothstep(0.0, max(outer_glow, 0.001), -sd);
	vec4 fill = vec4(tint.rgb, tint.a * fill_alpha);
	vec4 effect = mix(fill, edge_color, glow * pulse);
	COLOR = effect * COLOR;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
