print "ship:maxthrust " + ship:maxthrust.
list engines in myengines.
print "engine:maxthrust " + myengines[0]:maxthrust.

for eng in myengines {
  print eng:stage.
  print eng:name.
  print eng:maxthrust.
  print " ".
}.
