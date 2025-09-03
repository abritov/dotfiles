(define (git-config-file)
  (plain-file "gitconfig"
    "[user]
    name = fitumi
    email = pkgsail.dev@gmail.com

[alias]
    co = checkout
    ci = commit
    hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
    st = status
    br = branch
    lg = log --oneline --graph --decorate --all"))
