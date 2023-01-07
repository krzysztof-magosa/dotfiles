export ZSH=$HOME/.zsh/omz

ZSH_THEME=""
CASE_SENSITIVE="true"
HIST_STAMPS="dd.mm.yyyy"
ZSH_CUSTOM="$HOME/.zsh/custom"

plugins=(
  fzf
  zsh-autosuggestions
)

ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ASYNC=false
SPACESHIP_PROMPT_ORDER=(
  # user          # Username section
  dir           # Current directory section
  # host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # python        # Python section
  # elm           # Elm section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # java          # Java section
  # julia         # Julia section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # gcloud        # Google Cloud Platform section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # dotnet        # .NET section
  # kubectl       # Kubectl context section
  # terraform     # Terraform workspace section
  # ibmcloud      # IBM Cloud section
  exec_time     # Execution time
  # async         # Async jobs indicator
  # line_sep      # Line break
  # battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  # time          # Time stampts section
  char          # Prompt character
)
source $ZSH/oh-my-zsh.sh

p
