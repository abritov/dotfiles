(use-modules (gnu)
             (gnu packages ssh)
             (gnu packages wm)        ; i3-wm
             (gnu packages tmux)
             (gnu packages curl)
             (gnu packages emacs)
             (gnu packages admin)
      	     (gnu packages terminals)
             (gnu packages version-control)
             (gnu services networking)
             (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules cups desktop networking ssh xorg)

(operating-system
  (locale "en_GB.utf8")
  (timezone "Europe/Moscow")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "guix")

  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))

  (users (cons* (user-account
                  (name "fitumi")
                  (comment "Alexander")
                  (group "users")
                  (home-directory "/home/fitumi")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  ;; Packages available system-wide
  (packages (cons* tmux git tree curl emacs
                   i3-wm i3status alacritty
                   %base-packages))

  (services
   (append (list 
                 (service openssh-service-type)
                 ;; XFCE removed; slim service already in %desktop-services
                 (set-xorg-configuration
                   (xorg-configuration (keyboard-layout keyboard-layout)))

                 ;; Install a global /etc/gitconfig
                 (simple-service 'system-gitconfig etc-service-type
                                 (list `("gitconfig"
                                         ,(plain-file "gitconfig"
                                                      "[alias]
                                                      co = checkout
                                                      br = branch
                                                      ci = commit
                                                      st = status
                                                      lg = log --oneline --graph --decorate
                                                      hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short
                                                      undo = reset --soft HEAD~1
                                                      "))))

                 ;; Export GIT_CONFIG_SYSTEM so Git actually reads /etc/gitconfig
                 (simple-service 'git-system-env
                                 session-environment-service-type
                                 '(("GIT_CONFIG_SYSTEM" . "/etc/gitconfig"))))

           %desktop-services))

  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)
                (default-entry "GNU/Linux")))

  (file-systems (cons* (file-system
                         (mount-point "/")
                         (device (uuid "849aec36-916a-4482-a65d-3e513008a373" 'ext4))
                         (type "ext4"))
                       (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "D771-9347" 'fat32))
                         (type "vfat"))
                       %base-file-systems)))
