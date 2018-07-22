def options(ctx):
    ctx.load('scad', tooldir='.')

def configure(ctx):
    ctx.load('scad', tooldir='.')

def build(bld):
    bld(source='Customizer.scad');
