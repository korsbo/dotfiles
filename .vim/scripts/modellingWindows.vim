let s:init=glob('*init')
let s:cost=glob('*cost')
let model="m.model"
let s:firstColumn=['m.rkT', 'm.est']
let s:secondColumn=['m.opt']

exec 'e '.model
exec 'normal gg' 

for i in range(4)
	vsplit
endfor

let s:counter=0
for a in split(s:init)
	if s:counter ==0
		exec 'e '.a
		exec 'normal gg' 
	else
		exec 'split '.a
		exec 'normal gg' 
	endif
	let s:counter +=1
endfor

vertical resize 25
wincmd l

let s:counter=0
for a in split(s:cost)
	if s:counter ==0
		exec 'e '.a
		exec 'normal gg' 
	else
		exec 'split '.a
		exec 'normal gg' 
	endif
	let s:counter +=1
endfor

vertical resize 25
wincmd l

let s:counter=0
for a in s:firstColumn
	if s:counter ==0
		exec 'e '.a
		exec 'normal gg' 
	else
		exec 'split '.a
		exec 'normal gg' 
	endif
	let s:counter +=1
endfor

vertical resize 30
wincmd l

let s:counter=0
for a in s:secondColumn
	if s:counter ==0
		exec 'e '.a
		exec 'normal gg' 
	else
		exec 'split '.a
		exec 'normal gg' 
	endif
	let s:counter +=1
endfor

vertical resize 45
wincmd l

unlet s:init
unlet s:cost
unlet model
unlet s:firstColumn
unlet s:secondColumn
unlet s:counter
