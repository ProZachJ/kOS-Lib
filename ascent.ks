function ascend_to_velocity {
  parameter velocity.
  clearscreen.
  until ship:velocity:surface:mag >= velocity {
    print "Waiting for down range turn" at(0,1).
    print "Altitude: " + round(ship:altitude,0) + "m" at(0,11).
    print "Apoapsis: " + round(ship:altitude,0) + "m" at(0,12).
    wait 0.01.
  }.
}.

function turn_to_heading {
  parameter heading.
  parameter pitch.
  print "executing down range turn" at(0,1).
  lock steering to heading(heading, pitch).
  wait 1.
 }.

function gravity_turn {
  parameter turn_alt.
  until ship:altitude >= turn_alt  {
    print "Altitude: " + round(ship:altitude,0) + "m" at(0,11).
    print "Apoapsis: " + round(ship:apoapsis,0) + "m" at(0,12).
    print "waiting for gravity turn" at(0,1).
    wait 0.01.
  }.

  clearscreen.
  print "Executing gravity turn" at(0,1).
  lock steering to ship:prograde.
  wait 1.
}.

function seperate_fairings {
   parameter fairing_sep.	
   until ship:altitude >= fairing_sep { 
     print "Waiting for fairing seperation" at(0,1).
     wait 0.01.
   }
  clearscreen.
  stage.
  print "Fairing seperation" at (0,1).
}.

function burn_to_target_apoapsis {
  parameter target_apo.
  until ship:apoapsis >= target_apo {
    print "Altitude: " + round(ship:altitude) + "m" at(0,11).
    print "Apoapsis: " + round(ship:apoapsis) + "m" at(0,12).
    wait 0.01.
  }.
  lock throttle to 0.
  wait 1.
  clearscreen.
  print "coasting to apoapsis" at(0,1).
}.
