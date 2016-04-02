//Assumes 2 stages to reach target apoapsis
//circulatization burn details defined by a delegate
clearscreen.

//load libs
run ascent.ks.
run circularization.ks.

function launch {
  parameter target_apo.
  parameter ascent_velocity.
  parameter heading.
  parameter pitch.
  parameter gravity_alt.
  parameter fairing_alt.
  parameter orbit_burn.
  //launch
  run countdown.ks.

  //when maxthrust <= 0 then { stage. }.
  ascend_to_velocity(ascent_velocity).
  turn_to_heading(heading, pitch).
  wait until ship:altitude >= gravity_alt * 0.95.
  lock throttle to 0.
  stage.
  lock throttle to 1.
  gravity_turn(gravity_alt).
  seperate_fairings(fairing_alt).
  burn_to_target_apoapsis(target_apo).

  //eject spent stage
  stage.

  circularize(orbit_burn, 0.01).
  wait 1.
}
