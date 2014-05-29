{application, borg,
 [{description, "An OTP application for resource time-sharing"},
  {vsn, "1.0.0"},
  {modules, [
	     borg_app,
	     borg_event_logger,
	     borg_events,
	     borg_server, 
	     borg_server_sup,
	     borg_store,
	     borg_sup
	    ]},
  {registered, [borg_sup]},
  {applications, [kernel, stdlib, sasl, mnesia]},
  {mod, {borg_app, []}}
 ]}.
