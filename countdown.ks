LOCK THROTTLE TO 1.
LOCK STEERING TO UP.
PRINT "Ignition in:".
FROM {local countdown is 3.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
  PRINT "..." + countdown.
  WAIT 1. // pauses the script here for 1 second.
}.
PRINT "Activating Main Engine.".
STAGE.
WAIT 5.0.
PRINT "CLAMPS RELEASED".
STAGE.
