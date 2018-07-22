def options(ctx):
    pass

def configure(ctx):
    pass

from waflib import TaskGen
TaskGen.declare_chain(
        name         = 'openscad',
        rule         = 'openscad -o ${TGT} ${SRC}',
        shell        = False,
        ext_in       = '.scad',
        ext_out      = '.stl',
        reentrant    = False,
)
