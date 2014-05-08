 <script type="text/coffeescript">
width  = 500
height = 500


shape = seen.Shapes.sphere(2).scale(height * 0.4)
seen.Colors.randomSurfaces2(shape)


scene = new seen.Scene
  model    : seen.Models.default().add(shape)
  viewport : seen.Viewports.center(width, height)


context = seen.Context('seen-canvas', scene).render()


context.animate()
  .onBefore((t, dt) -> shape.rotx(dt*1e-4).roty(0.7*dt*1e-4))
  .start()

dragger = new seen.Drag('seen-canvas', {inertia : true})
dragger.on('drag.rotate', (e) ->
  xform = seen.Quaternion.xyToTransform(e.offsetRelative...)
  shape.transform(xform)
  context.render()
)
</script>
  