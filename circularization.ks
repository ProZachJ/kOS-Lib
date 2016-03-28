//circularize method takes a function delegate as a parameter
//allows custom logic for burn initiation

function circularize {
  parameter burn_cb.
  parameter target_ecc.
  parameter target_apo.
  set circ_node to plot_circularization_node(target_ecc, target_apo).
  set burn_duration to calculate_burn_duration(circ_node).
  timewarp(circ_node, burn_duration).
  print "Point".
  point_to_node(circ_node).
  wait until circ_node:eta <= (burn_duration/2).
  burn(burn_cb, target_ecc).
}.

function timewarp {
  parameter circ_node.
  parameter burn_duration.
  print "warping" at(0,12).
  set warp to 4.
  wait until circ_node:eta <= (burn_duration/2 + 120).
  set warp to 0.
}.

function plot_circularization_node {
  parameter target_ecc.
  parameter target_apo.
  set apo_time to time:seconds + eta:apoapsis.
  //TODO detect body and calculate escape velocity.
  set initial_burn_velocity to 3431 - velocity:orbit:mag.
  set circ_node to node(apo_time, 0, 0, initial_burn_velocity).
  add circ_node.
  until round(circ_node:orbit:eccentricity, 2) = target_ecc {
    print  round(circularizerc_node:orbit:periapsis) + "   " +  round(ship:apoapsis) + " " + circ_node:orbit:eccentricity at(0,1).
    if circ_node:orbit:apoapsis > ship:apoapsis {
      print "High Eccentricity " + circ_node:orbit:eccentricity.
      set circ_node:prograde to circ_node:prograde * 0.5.
    }else if circ_node:orbit:periapsis < target_apo {
      print "Low Eccentricity " + circ_node:orbit:eccentricity.
      set circ_node:prograde to circ_node:prograde * 1.5.
    }.
    wait 0.
  }
  print "Node Apoapsis: " + circ_node:orbit:apoapsis.
  print "Node Periapsis: " + circ_node:orbit:periapsis.
  print "Node DeltaV: " + circ_node:deltav:mag.
  return circ_node.
}.

function calculate_burn_duration {
  parameter mynode.
  list engines in probe.
  set engine to probe[0].
  lock throttle to 0.
  engine:activate().
  set max_acc to engine:maxthrust/ship:mass.
  engine:shutdown().
  set burn_duration to round(mynode:deltav:mag)/round(max_acc).
  print "crude burn duration: " + round(burn_duration) + "s".
  return burn_duration.
}.

function point_to_node {
  parameter mynode.
  set burn_vector to mynode:burnvector.
  lock steering to burn_vector.
  rcs on.
  wait until abs(burn_vector:direction:pitch - facing:pitch) < 0.15 and abs(burn_vector:direction:yaw - facing:yaw) < 0.15.
  rcs off.
  print "facing node".
}.

function burn {
  parameter burn_cb.
  parameter target_ecc.
  set mynode to nextnode.
  burn_cb().
  wait until round(ship:orbit:eccentricity, 2) <= target_ecc.
  lock throttle to 0.
  remove mynode.
}.
