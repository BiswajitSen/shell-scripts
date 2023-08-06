#!/bin/zsh

echo '#!/bin/zsh'>fib_sol_part
echo $1 $2 > store
yes 'cat store | tr "\n" " " | sed "s/.*\(.\) \(.\)/\1 \2 + p/" | dc >> store;'  | head -n$3 >> fib_sol_part
echo 'cat store | tr "\\n" " " > res_store ' >> fib_sol_part
echo echo The $3th term is : >> fib_sol_part
echo cut -f$3 -w res_store >> fib_sol_part
echo echo The Series is listed below : >> fib_sol_part
echo cut -w -f1-$3 res_store >> fib_sol_part
./fib_sol_part 


