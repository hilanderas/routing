statefile = $(CURDIR)/.state.conf
include $(statefile)
ss = INIT CONFGENED CONFQUEUED RUNNING

.PHONY: $(isstate) $(setstate)
isstate: $(addprefix is_, $(ss))
setstate: $(addprefix set_, $(ss))
is_%:
	./is.sh $(STATE) $* 
set_%:
	sed -i '/STATE =/c\STATE = $*' $(statefile)

get_state:
	echo "Current state is $(STATE)"

is_RUNNING_CONFQUEUED:
	make -f sm.mk is_RUNNING || make -f sm.mk is_CONFQUEUED 

