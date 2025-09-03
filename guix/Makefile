CHANNELS   = $(HOME)/dotfiles/guix/etc/guix/channels.scm
SYS_CONFIG = $(HOME)/dotfiles/guix/etc/config.scm
HOME_CONFIG= $(HOME)/dotfiles/guix/home/home-configuration.scm

.PHONY: pull system home
pull:
	guix pull -C $(CHANNELS) && guix describe -f channels > $(CHANNELS)

system:
	sudo -E guix system reconfigure $(SYS_CONFIG)

home:
	guix home reconfigure $(HOME_CONFIG)
	source ~/.guix-home/setup-environment
