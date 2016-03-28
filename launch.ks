//Assumes 2 stages to reach target apoapsis
//circulatization burn details defined by a delegate
clearscreen.

//load libs
run ascent.ks.
run circularization.ks.

//launch
run countdown.ks.
when maxthrust <= 0 then { stage. }.
set target_apo to 2863000.
ascend_to_velocity(100).
turn_to_heading(90,80).
gravity_turn(15000).
seperate_fairings(65000).
burn_to_target_apoapsis(target_apo).

//eject spent stage
stage.

//pass burn routine and target eccentricity to circularizer
circularize(doBurn@, 0.025, target_apo).
wait 1.

function doBurn {
  clearscreen.
  print "BURN" AT(0,1).
  rcs on.
  wait 1.
  lock throttle to 1.
  stage.
  rcs off.
}.
