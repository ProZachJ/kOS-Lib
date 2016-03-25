//Assumes 2 stages to reach target apoapsis
//circulatization burn details defined by a delegate
clearscreen.
//load libs
run ascent.ks.
run circularization.ks.
//launch
run countdown_to_launch.ks.
when maxthrust <= 0 then { stage. }.
ascend_to_velocity(100).
turn_to_heading(90,85).
gravity_turn().
seperate_fairings().
burn_to_target_apoapsis(2863000).

//eject spent stage
stage.

//pass burn routine to circularizer
set burncb to doBurn@.
circularize(burncb).
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
