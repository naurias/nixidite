{ den, lib, inputs, ... }:
{
  den.aspects.zsh = {
    nixos =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        programs.zsh = {
          enable = true;
          autosuggestions.enable = true;
          enableCompletion = true;
          syntaxHighlighting.enable = true;
        };
      };
    homeManager =
      {
        config,
        lib,
        pkgs,
        ...
      }:
      {
        programs.zsh = {
          enable = true;
          enableCompletion = true;
          syntaxHighlighting.enable = true;
          autosuggestion.enable = true;
          plugins = [
            {
              name = "fzf-tab";
              src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
            }
          ];
        };
      };
    provides.environment = {
      nixos =
        {
          config,
          lib,
          pkgs,
          ...
        }:
        {
          environment.variables = {
            EDITOR = "nvim";
          };
          environment.localBinInPath = true;
        };
      homeManager =
        {
          config,
          lib,
          pkgs,
          ...
        }:
        {
          programs.zoxide = {
            enable = true;
            enableZshIntegration = true;
          };
          programs.yazi = {
            enable = true;
            enableZshIntegration = true;
          };

          programs.eza = {
            enable = true;
            enableZshIntegration = false;
          };
          programs.bat = {
            enable = true;
          }; 

          programs.fzf = {
            enable = true;
            enableZshIntegration = true;
            defaultOptions = [
              "--preview='bat --color=always -n {}'"
              "--bind 'ctrl-/:toggle-preview'"
            ];
            defaultCommand = "fd --type f --exclude .git --follow --hidden";
            changeDirWidgetCommand = "fd --type d --exclude .git --follow --hidden";
          };
          home.file = {
            ".config/fzftab" = {
              source = "${inputs.dotfiles}/fzftab";
              recursive = true;
            };
            ".config/ohmyposh" = {
              source = "${inputs.dotfiles}/ohmyposh";
              recursive = true;
            };
          };
          programs.zsh = {
            initContent = ''
              export NIX_PATH="nixpkgs=channel:nixos-unstable"
              export NIX_LOG=info

              # Keybinding
              bindkey -e
              bindkey '^p' history-search-backward
              bindkey '^n' history-search-forward
              bindkey '^[w' kill-region
              bindkey "^[[3~" delete-char


              # Completion styling
              zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
              zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
              zstyle ':completion:*' menu no
              zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
              zstyle ':fzf-tab:complete:z:*' fzf-preview 'ls --color $realpath'
              zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

              #Alias
              alias  l='eza -lh  --icons=auto' # long list
              alias ls='eza -1   --icons=auto' # short list
              alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
              alias ld='eza -lhD --icons=auto' # long list dirs
              alias lt='eza --icons=auto --tree' # list folder as tree
              eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/second.toml)"
            '';
          };
        };
    };
  };
}
