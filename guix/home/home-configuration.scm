(use-modules
	  (gnu packages)
	  (gnu services)
	  (gnu packages tmux)
	  (gnu packages gnuzilla)
	  (gnu packages web-browsers)
	  (gnu packages version-control)
	  (gnu packages package-management)
	  (gnu home services)
	  (gnu home services shells)
	  (ice-9 rdelim)
	  (guix gexp)          ; ← optional now, but harmless
  )
(include "gitconfig.scm")

(home-environment
  (packages (list stow tmux tig
		  (specification->package "emacs")
		  (specification->package "emacs-use-package")
		  ))
  (services
    (list 

	  (service home-bash-service-type
           (home-bash-configuration
             (bashrc
              (list (plain-file "bashrc-extra"
                     "eval \"$($HOME/.local/bin/mise activate bash)\"")))))

	  (simple-service 'git-config home-files-service-type
			  (list `(".gitconfig" ,(git-config-file))))

			  )))
