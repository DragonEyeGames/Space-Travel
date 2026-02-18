shader_type canvas_item;

uniform int color_count = 1;

// Max size must be constant in shaders
uniform vec4 from_colors[16]: source_color;
uniform vec4 to_colors[16]: source_color;

// Helps if filtering/compression slightly changes colors
uniform float tolerance = 0.01;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    vec4 final_color = tex_color;

    for (int i = 0; i < 16; i++) {
        if (i >= color_count) {
            break;
        }

        if (distance(tex_color.rgb, from_colors[i].rgb) < tolerance) {
            final_color.rgb = to_colors[i].rgb;
            break;
        }
    }

    COLOR = final_color;
}