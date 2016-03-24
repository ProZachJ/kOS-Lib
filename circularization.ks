function circularize {
  parameter burn_cb.
  
  set local circ_node to plot_circularization_node().
  set local burn_duration to calculate_burn_duration(circ_node).
  wait until circ_node:eta <= (burn_duration/2 + 60).
  point_to_node(circ_node).
  wait until circ_node:eta <= (burn_duration/2).
  burn(burn_cb).
}.

function plot_circulatization_node {
  set local apo_time to time:seconds + eta:apoapsis.
  set local circ_node to node(apo_time, 0, 0, 100).
  add circ_node.
  until circ_node:orbit:periapsis = ship:apoapsis {
      set circ_node:prograde to circ_node:prograde + 5.
  }
  print "Node Apoapsis: " + circ_node:orbit:apoapsis.
  print "Node Periapsis: " + circ_node:orbit:periapsis.
  print "Node DeltaV: " + circ_node:deltav:mag.
  return circ_node.
}.

function calculate_burn_duration {
  parameter mynode.
  
  set local max_acc to ship:maxthrust / ship:mass.
  set local burn_duration to mynode:deltav:mag / max_acc.
  print "crude burn duration: " + round(burn_duration) + "s".
  return burn_duration.	
}.

function point_to_node {
  parameter mynode.
  
  set local burn_vector to mynode:burnvector.
  lock steering to burn_vector.
  rcs on.
  wait until abs(burn_vector:pitch - facing:pitch) < 0.15 and abs(burn_vector:yaw - facing:yaw) < 0.15.
  rcs off.
  print "facing node".	
}.

function burn {
  parameter burn_cb.
  
  burn_cb().	
}.
