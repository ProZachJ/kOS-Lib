copy ascent.ks to 1.
copy circularization.ks to 1.
copy countdown.ks to 1.
copy launch.ks to 1.

switch to 1.

run launch.ks.
delete ascent.ks.
delete countdown.ks.
delete launch.ks.

copy drop_orbit.ks from 0.
run drop_orbit.ks.
wait 1.
copy activate.ks from 0.
run activate.ks.
