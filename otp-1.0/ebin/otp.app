{application, otp,
 [{description, "A generic OTP application"},
  {vsn, "1.0"},
  {modules, [
	     opt_app, 
	     otp_super,
	     otp_server
	    ]},
  {registered, [otp_super]},
  {applications, [kernel, stdlib]},
  {mod, {otp_app, []}}
 ]}.
