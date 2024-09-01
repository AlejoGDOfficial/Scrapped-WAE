#pragma header

uniform float time;

float random(vec2 st)
{
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233)) + time) * 43758.5453123);
}

void main()
{
    vec2 uv = openfl_TextureCoordv;

    vec2 off = vec2(0.025, 0.01);

    float offset = random(off) * 0.025;

    vec4 col1 = texture2D(bitmap, uv.st - vec2(offset, 0.0));
    vec4 col2 = texture2D(bitmap, uv.st - vec2(0.0, 0.0));
    vec4 col3 = texture2D(bitmap, uv.st - vec2(-offset, 0.0));

    vec4 toUse=texture2D(bitmap, uv);

    toUse.r = col1.r + sin(time * 10.0) * 0.5;
    toUse.g = col2.g + sin(time * 5.0) * 0.5;
    toUse.b = col3.b + sin(time * 2.5) * 0.5 + 0.5;

    toUse.y = sin(time) * toUse.y + 0.5;
    
    gl_FragColor = toUse;
}