CLEARSCREEN.

run circularize.ks.

LOCK THROTTLE TO 1.0. 

PRINT "Counting down:".

FROM {local countdown is 3.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1. // pauses the script here for 1 second.
}

LOCK STEERING TO UP.

WAIT 0.5.
PRINT "Activating Main Engine.".
STAGE.

WAIT 1.
PRINT "CLAMPS RELEASED".
STAGE.

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
lock steeing to ship:prograde.


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
stage.
clearscreen.

print "coasting to apoapsis" at(0,1).

function doBurn {
  clearscreen.
  PRINT "BURN" AT(0,1).
  RCS ON.
  wait 1.
  lock throttle to 1.
  STAGE.
  RCS OFF.

}

set burncb to doBurn@.
circularize(burncb).
wait 1.
