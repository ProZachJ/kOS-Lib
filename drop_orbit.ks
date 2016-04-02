//should drop to 4 hour orbit and recircularize after 1 orbit

//lib
run circularization.ks.

function dropOrbit {
	parameter target_orbital_period.
  parameter retro_burn.
	parameter circ_burn.

	retro_burn().
	wait until ship:orbit:period <= target_orbital_period.
	lock throttle to 0.
	wait 1.0.
	circularize(circ_burn, 0.01).
}.
