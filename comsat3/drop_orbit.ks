//should drop to 4 hour orbit and recircularize after 1 orbit

//lib
run circularization.ks.

lock steering to ship:retrograde.
rcs on.
print facing:pitch.
print ship:retrograde:pitch.
wait until abs(ship:retrograde:pitch - facing:pitch) < 0.15 and abs(ship:retrograde:yaw - facing:yaw) < 0.15.
lock throttle to 1.
rcs off.
wait until ship:orbit:period <= 14400.
lock throttle to 0.
wait 1.0.
circularize(circ_burn@, 0.01).
wait 1.0.

function circ_burn {
	clearscreen.
	list engines in probe.
	print "circ burn".
	rcs on.
	set ship:control:fore to 1.
	wait 2.0.
	probe[0]:activate().
	lock throttle to 1.
	rcs off.
	set ship:control:neutralize to true.
}.
