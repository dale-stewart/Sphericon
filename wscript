import re

def options(ctx):
    pass

def configure(ctx):
    pass

def build(bld):
    def expand_include(tsk):
        contents = tsk.inputs[0].read()
        include = tsk.inputs[1].read()
        p = re.compile('include .*\n')
        contents = p.sub(include, contents)
        tsk.outputs[0].write(contents)

    bld(source=['Customizer.scad', 'Sphericon.scad'], target='SphericonCustomizer.scad', rule=expand_include)

    bld(source='Customizer.scad', target='Sphericon4.stl', rule='openscad -o ${TGT} -D sides=4 ${SRC}')
    bld(source='Customizer.scad', target='Sphericon6.stl', rule='openscad -o ${TGT} -D sides=6 ${SRC}')
    bld(source='Customizer.scad', target='Sphericon8.stl', rule='openscad -o ${TGT} -D sides=8 ${SRC}')
    bld(source='Customizer.scad', target='Sphericon4B.stl', rule='openscad -o ${TGT} -D sides=4 -D \'bulbous="Yes"\' ${SRC}')
    bld(source='Customizer.scad', target='Sphericon6B.stl', rule='openscad -o ${TGT} -D sides=6 -D \'bulbous="Yes"\' ${SRC}')
    bld(source='Customizer.scad', target='Sphericon8B.stl', rule='openscad -o ${TGT} -D sides=8 -D \'bulbous="Yes"\' ${SRC}')
