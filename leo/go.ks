copy ascent.ks to 1.
copy circularization.ks to 1.
copy countdown.ks to 1.
copy launch.ks to 1.

switch to 1.

run launch.ks.
//target_alt, asc_vel, heading, pitch, gravity_alt, fairing_alt
launch(300000, 100, 90, 80, 10500, 65000, orbit_burn_cb@).

delete ascent.ks.
delete countdown.ks.
delete launch.ks.


wait 1.

copy activate.ks from 0.
run activate.ks.

function orbit_burn_cb {
	clearscreen.
	print "BURN" at(0,1).
	rcs on.
	wait 1.
	lock throttle to 1.
	stage.
	rcs off.
}
