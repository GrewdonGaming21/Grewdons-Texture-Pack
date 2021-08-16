#version 150

vec4 linear_fog(vec4 inColor, float vertexDistance, float fogStart, float fogEnd, vec4 fogColor) {
    vertexDistance = vertexDistance/2.5;
    
    if (vertexDistance < fogStart) {
        return inColor;
    };
    vertexDistance = vertexDistance < fogEnd ? vertexDistance : fogEnd;
    
    float fogIntensity = smoothstep(fogStart, fogEnd, vertexDistance);
    return vec4(mix(inColor.rgb, fogColor.rgb, fogIntensity*fogColor.a), fogColor.a);
}

float linear_fog_fade(float vertexDistance, float fogStart, float fogEnd) {
    if (vertexDistance <= fogStart) {
        return 1.0;
    } else if (vertexDistance >= fogEnd) {
        return 0.0;
    }

    return smoothstep(fogEnd, fogStart, vertexDistance);
}

//functions
/*
mix(baseColor.rgb, color.rgb, intensity[float]) -> vec3
smoothstep(min[float], max[float], x[float]) -> float
x = a != b ? 1.0 : 0.0
*/