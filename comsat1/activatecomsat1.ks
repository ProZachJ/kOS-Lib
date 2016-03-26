set solar to ship:partsdubbed("largeSolarPanel").
for panel in solar {
 set deploy to panel:getmodule("ModuleDeployableSolarPanel").
 deploy:doaction("extend panel", true).
}.
