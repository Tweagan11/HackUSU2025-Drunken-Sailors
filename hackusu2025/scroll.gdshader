shader_type canvas_item;

uniform float speed = 5.0;

void vertex() {
	UV.y -= TIME * 0.05;
}