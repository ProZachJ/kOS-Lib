run circularization.ks.

circularize(doBurn@, 0.01).
wait 1.

function doBurn {
  clearscreen.
  print "circ burn" at(0,1).
  rcs on.
  wait 1.
  lock throttle to 1.
  rcs off.
}.
