

REVISOR_OPTS = --cli --config revisor.conf --kickstart=anaconda-f11.ks \
                     --kickstart-include --kickstart-default --install-unified \
                     --model 'xs-f11-i386aus' --yes


with-revisor:
	revisor $(REVISOR_OPTS) --debug 1

with-revisor-debug:
	revisor $(REVISOR_OPTS) --debug 10
