fun! s:GetSelectedText() range abort
	let [line_start, column_start] = getpos("'<")[1:2]
	let [line_end, column_end] = getpos("'>")[1:2]
	let line = getline('.')
	return line[column_start - 1 : column_end - 1]
endf

fun s:ShellEscapeArgument(arg)
	let arg = substitute(a:arg, "\"", '\\"', "g")
	return '"' . arg . '"'
endf

fun! vopen#VOpen(command, arg_with_placeholder, preprocessing_funcs) range abort
	let selection = s:GetSelectedText()
	for preproc_func in a:preprocessing_funcs
		if strlen(preproc_func) > 0
			let selection = call(preproc_func, [selection])
		endif
	endfor

	let cmd_arg = substitute(a:arg_with_placeholder, "{selection}", selection, 'g')
	let cmd_arg = s:ShellEscapeArgument(cmd_arg)
  let output = system(g:vopen_command . " " . cmd_arg)
	if v:shell_error != 0
		echo output
		return 1
	endif
	return 0
endf
