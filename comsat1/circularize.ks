//should drop to 4 hour orbit and recircularize after 1 orbit

//lib
run circularization.ks.

circularize(doBurn@, 0.01).
wait 1.0.

function doBurn {
	list engines in probe.
	set engine to probe[0].
	clearscreen.
	print "circ burn".
	rcs on.
	wait 1.0.
	lock throttle to 1.
	engine:activate().
	rcs off.
}.
