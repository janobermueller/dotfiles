# Movement
abbr -a -U l "ls -l"
abbr -a -U la "ls -lA"
abbr -a -U ... "cd ../.."
abbr -a -U .... "cd ../../.."
abbr -a -U ..... "cd ../../../.."

# Git
abbr -a -U g "git"
abbr -a -U gs "git status"
abbr -a -U gd "git diff --color"
abbr -a -U ga "git add"
abbr -a -U gc "git commit"
abbr -a -U gco "git checkout"
abbr -a -U gb "git branch"
abbr -a -U gsb "git show-branch"
abbr -a -U gg "git grep"
abbr -a -U gl "git log"
abbr -a -U glg "git log --graph --pretty=format:'%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) %C(cyan)<%an>%Creset' --abbrev-commit"
abbr -a -U gk "gitk --all"
abbr -a -U gf "git fetch"
abbr -a -U gpl "git pull"
abbr -a -U gps "git push"
abbr -a -U gr "git rebase"
abbr -a -U gri "git rebase --interactive"
abbr -a -U gcp "git cherry-pick"
abbr -a -U grs "git reset"
abbr -a -U grv "git revert"
abbr -a -U grm "git rm"

# Remove Greeting
set fish_greeting

source ~/.config/fish/fish_prompt.fish