clearscreen.
//load libs
run circularization.ks.

run countdown_to_launch.ks.

when maxthrust <= 0 then {
    stage.
}

clearscreen.
until ship:velocity:surface:mag >= 100 { 
    print "Waiting for down range turn" at(0,1).
    print "Altitude: " + round(ship:altitude,0) + "m" at(0,11).
    print "Apoapsis: " + round(ship:altitude,0) + "m" at(0,12).  
    wait 0.01.    
}

print "executing down range turn" at(0,1).
lock steering to heading(90,85).

until ship:altitude >= 30000  {
    print "Altitude: " + round(ship:altitude,0) + "m" at(0,11).
    print "Apoapsis: " + round(ship:apoapsis,0) + "m" at(0,12). 
    print "waiting for gravity turn" at(0,1).
    wait 0.01.    
}

clearscreen.
print "Executing gravity turn" at(0,1).
lock steering to ship:prograde.


until ship:altitude >= 65000 {
    print "Waiting for fairing seperation" at(0,1).
    wait 0.01.
}


stage.
clearscreen.
print "Fairing seperation" at (0,1).


until ship:apoapsis >= 2863000 {
    print "Altitude: " + round(ship:altitude,0) + "m" at(0,11).
    print "Apoapsis: " + round(ship:apoapsis,0) + "m" at(0,12).
    wait 0.01.
}

lock throttle to 0.
wait 1.
stage.
clearscreen.

print "coasting to apoapsis" at(0,1).

function doBurn {
  clearscreen.
  PRINT "BURN" AT(0,1).
  RCS ON.
  wait 1.
  lock throttle to 1.
  stage.
  RCS OFF.

}

set burncb to doBurn@.
circularize(burncb).
wait 1.
