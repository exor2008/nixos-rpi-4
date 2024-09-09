{ ... }:

{
  wayland.windowManager.sway = {
    config = {
      window = {
        border = 3;
        titlebar = false;
        commands = [
          {
            command = "opacity 0.95, border pixel 3";
            criteria = {
              class = ".*";
            };
          }
          {
            command = "opacity 0.95, border pixel 3";
            criteria = {
              app_id = ".*";
            };
          }
        ];
      };
    };
  };
}
