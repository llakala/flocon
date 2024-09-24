{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-space";
    escapeTime = 10;
    clock24 = true;
    keyMode = "vi";
    mouse = true;
    baseIndex = 1;
    extraConfig = ''
      set-option -a terminal-features "''${TERM}:RGB"
    '';
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_window_left_separator ""
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"

          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"

          set -g @catppuccin_status_modules_right "directory user host session"
          set -g @catppuccin_status_left_separator  " "
          set -g @catppuccin_status_right_separator ""
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"

          set -g @catppuccin_directory_text "#{pane_current_path}"

          set -g @catppuccin_flavor 'frappe'
        '';
      }
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
    ];
  };
  programs.fzf.tmux.enableShellIntegration = true;
}
