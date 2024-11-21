if exists("g:vopen_plugin_loaded")
	finish
endif
let g:vopen_plugin_loaded = 1

if !exists("g:vopen_command")
	let g:vopen_command = "xdg-open"
endif

com! -nargs=1 -range VOpenLink '<,'> call vopen#VOpen(g:vopen_command, <f-args>, [])
com! -nargs=+ -range VOpenLinkCustom '<,'> call vopen#VOpen(g:vopen_command, <f-args>)
com! -nargs=1 -range VOpenLinkEscaped '<,'> call vopen#VOpen(g:vopen_command, <f-args>, ['vopen#url_encode#UrlEncode'])

