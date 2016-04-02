copy ascent.ks to 1.
copy circularization.ks to 1.
copy countdown.ks to 1.
copy launch.ks to 1.

switch to 1.

run launch.ks.
//target_alt, asc_vel, heading, pitch, gravity_alt, fairing_alt
launch(2863000, 100, 90, 80, 12000, 65000).

delete ascent.ks.
delete countdown.ks.
delete launch.ks.

copy drop_orbit.ks from 0.
run drop_orbit.ks.

dropOrbit(14400, retro_burn@, circ_burn@).
wait 1.

copy activate.ks from 0.
run activate.ks.

function retro_burn {
	lock steering to ship:retrograde.
	rcs on.
	wait until abs(ship:retrograde:pitch - facing:pitch) < 0.15 and abs(ship:retrograde:yaw - facing:yaw) < 0.15.
	set ship:control:fore to 1.
	wait 2.0.
	lock throttle to 1.
	rcs off.
}

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
