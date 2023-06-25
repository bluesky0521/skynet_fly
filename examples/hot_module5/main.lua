local skynet = require "skynet"
local mod_config = require "mod_config"
local util = require "util"

skynet.start(function()
	skynet.error("start hot_module5!!!>>>>>>>>>>>>>>>>>")
	local cmgr = skynet.uniqueservice('contriner_mgr')

	for mod_name,mod_cfg in util.sort_ipairs(mod_config,function(a,b)
		return a.launch_seq < b.launch_seq
	end) do
		skynet.call(cmgr,'lua','load_module',mod_name,mod_cfg.launch_num,mod_cfg.mod_args,mod_cfg.default_arg)
	end

	skynet.exit()
end)