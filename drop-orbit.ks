//should drop to 4 hour orbit and recircularize after 1 orbit

//lib
run circularization.ks.

lock steering to ship:retrograde.
lock throttle to 1.
rcs on.
wait until ship:facing = ship:retrograde.
list engines in probe.
set engine to probe[0].
engine:activate().
rcs off.
wait until ship:orbit:period <= 14400.
engine:shutdown().
wait 1.0.
circularize(doBurn@, 0.01).
wait 1.0.

function doBurn {
	list engines in probe.
	set engine to probe[0].
	clearscreen.
	print "circ burn".
	rcs on
	wait 1.0.
	lock throttle to 1.
	engine:activate().
	rcs off.
}.
