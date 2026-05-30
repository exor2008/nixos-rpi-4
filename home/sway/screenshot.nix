{ config, ... }:

{
  wayland.windowManager.sway = {
    extraConfig = ''
      # screenshots
      set $satty satty -f - --initial-tool=arrow --copy-command=wl-copy --actions-on-escape="save-to-clipboard,exit" --brush-smooth-history-size=5 --disable-notifications
      set $printscreen_mode 'printscreen (r:region, f:full, w:window)'
      mode $printscreen_mode {
          bindsym r exec swaymsg 'mode "default"' && grim -t ppm -g "$(slurp -d)" - | $satty
          bindsym f exec swaymsg 'mode "default"' && grim -t ppm - | $satty
          bindsym w exec swaymsg 'mode "default"' && swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | grim -t ppm -g - - | $satty

          bindsym Return mode "default"
          bindsym Escape mode "default"
      }
      bindsym ${config.wayland.windowManager.sway.config.modifier}+Shift+p mode $printscreen_mode
    '';
  };
}
