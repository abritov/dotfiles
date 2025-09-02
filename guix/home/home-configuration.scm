(use-modules
	  (gnu packages)
	  (gnu home services)
	  (gnu packages gnuzilla)
	  (gnu home services shells)
	  (gnu packages web-browsers)
	  (gnu packages package-management)
	  (ice-9 rdelim)
	  (guix gexp)          ; ← optional now, but harmless
  )

(home-environment
  (packages (list stow icecat
		  (specification->package "emacs")
		  (specification->package "emacs-use-package")
		  ))
  (services
    (list (service home-bash-service-type
		   (home-bash-configuration))
	  )))
