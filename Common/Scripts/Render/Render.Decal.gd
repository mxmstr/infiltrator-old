# Decal Shader
#  V0.1

#  Author: Darren Chambers


#  Implementation based on paper titled "Implicit Decals"


#------------------------------------------------------------------------------

from bge import logic

objects = logic.getCurrentScene().objects

GameManager = objects['GameManager']

# -------------------------------------
ShaderObjects = GameManager['NPCList'] # objects to apply shader to
MaterialIndexList = [0] # material index

#decalObj = objects['target'] # object used to place decal
lightObj = objects['Point.001'] # default lamp object
# -------------------------------------

own = logic.getCurrentController().owner


VertexShader = """

// decal projection variables
varying vec3 vertPos;


// diffuse shading variables
varying vec3 diff;

uniform vec3 lightPos;
uniform float lightInt;
uniform vec3 diffCol;




void main(){
	gl_Position = ftransform();  // default vertex transformation
	
	
	/* decal projection vertex shader code */
	
	// assign varying variable so fragment shader knows where vertex is
	vertPos = gl_Vertex.xyz;
	
	/* end decal projection vertex shader */
	
	
	
	/* diffuse shading vertex shader code */
	
	vec3 normal = normalize(gl_NormalMatrix * gl_Normal);
	
	vec3 lightDir = normalize(lightPos);
	
	float NdotL = max(dot(normal,lightDir),0.0);
	
	diff = NdotL * lightInt * diffCol;
	
	/* end diffuse shading vertex shader */
	
	
}


"""

 

FragmentShader = """

// decal projection variables
varying vec3 vertPos;

uniform sampler2D decalTexture;

uniform vec3 decalPos;
uniform vec3 Ui;
uniform vec3 Vi;

uniform float Si;

uniform float thetaOffset;



// diffuse shading variables
varying vec3 diff;


void main(){

	// calculate difference between decal target position and vertex
	vec3 posDiff = decalPos - vertPos;
	
	// calculate r texture coordinate
	float r = length(posDiff)/Si;
	
	// calculate theta texture coordinate
	float theta = atan(dot(Vi,posDiff),dot(Ui,posDiff));
	
	// build the coordinate vector
	vec2 texCoord0 = vec2(theta/radians(360.0) + thetaOffset,r);
	
	// get the color from the calculated point in the texture
	vec4 color = texture2D( decalTexture, texCoord0);
	
	//set pixel color
	// diffuse color when outside decal range
	// mix of decal and diffuse color when in range
	if ((r >= 1.0) || (color[3] <= .5)) {
		gl_FragColor = vec4(diff,1.0);
	} else {
		gl_FragColor = color + (1.0 - color[3]) * vec4(diff,1.0);
	}
	
}
"""



def MainLoop ():
    # for each object
    for obj in ShaderObjects:

        obj = obj.children['ActorArmature'].children['ActorMesh']

        mesh_index = 0 
        mesh = obj.meshes[mesh_index]
        decalObj = own

        while mesh != None:
            
            for mat in mesh.materials:
                
                # regular TexFace materials do NOT have this function
                if not hasattr(mat, "getMaterialIndex"):
                    return
                
                mat_index = mat.getMaterialIndex()
                
                # find an index	
                found = 0
                for i in range(len(MaterialIndexList)):
                    if mat_index == MaterialIndexList[i]:
                        found=1
                        break
                if not found: continue

                shader = mat.getShader()
                if shader != None:
                    if not shader.isValid():
                        
                        shader.setSource(VertexShader, FragmentShader,1)
                    
                    # set uniform variables and samplers for the shaders
                    shader.setUniformfv('decalPos',decalObj.position)
                    
                    # passing x axis as Ui and y axis as Vi means z axis should be about normal to surface
                    shader.setUniformfv('Ui',decalObj.orientation[0]) # target x axis
                    shader.setUniformfv('Vi',decalObj.orientation[1]) # target y axis
                    shader.setUniform1f('Si',-1)#own['scale'])
                    shader.setUniform1f('thetaOffset',0.0)#own['angOff'])
                    
                    shader.setUniformfv('lightPos', lightObj.position)
                    shader.setUniform1f('lightInt', 1.0)
                    shader.setUniform3f('diffCol', .5,.5,.5)
                    
                    shader.setSampler('decalTexture',0)
                    
            mesh_index += 1
            
            if mesh_index < len(obj.meshes):
                mesh = obj.meshes[mesh_index]
            else:
                mesh = None

# -------------------------------------
MainLoop()
# -------------------------------------