module("luci.controller.modemwebui", package.seeall)

function index()
	if not (luci.sys.call("pidof webuiserver > /dev/null") == 0) then
		return
	end
	
	entry({"admin", "modem", "modemwebui"}, template("modemwebui/modemwebui"), _("ModemWebUI"), 10).leaf = true
end