try
	@eval using REPL
	# @eval using OhMyREPL
catch
	@warn "Could not load OhMyREPL"
end

try
    @eval using Revise
    # Turn on Revise's file-watching behavior
    Revise.async_steal_repl_backend()
catch
    @warn "Could not load Revise."
end

try
    @eval using Rebugger
    atreplinit(Rebugger.repl_init)
catch
    @warn "Could not turn on Rebugger key bindings."
end
