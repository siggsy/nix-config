{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    enableVteIntegration = true;

    initExtra = ''
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' unstagedstr ' %F{1}*%f'
    zstyle ':vcs_info:*' stagedstr ' %F{2}+%f'
    zstyle ':vcs_info:git*' formats " (%F{3}%b%f%u%c)"
    zstyle ':vcs_info:git*' actionformats" (%F{3}%b%f | %F{1}%a%f) "
    precmd () { vcs_info }
    
    # Prompt settings
    setopt prompt_subst
    PROMPT=' %(4~|%-1~/…/%2~|%3~)''${vcs_info_msg_0_} $ '
    '';
  };
}