{ self, ...  }:

{
  programs = {
    wlogout = {
      enable = true;
      layout = [
        {
          label = "lock";
          action = "swaylock";
          text = "Lock";
          keybind = "l";
        }
        {
          label = "hibernate";
          action = "systemctl hibernate";
          text = "Hibernate";
          keybind = "h";
        }
        {
          label = "logout";
          action = "loginctl terminate-user $USER";
          text = "Logout";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "shutdown";
          text = "Shutdown";
          keybind = "s";
        }
        {
          label = "suspend";
          action = "systemctl suspend";
          text = "Suspend";
          keybind = "u";
        }
        {
          label = "reboot";
          action = "reboot";
          text = "Reboot";
          keybind = "r";
        }
      ];

      style = ''
        * {
        	background-image: none;
        	box-shadow: none;
        	text-shadow: none;
        }
        
        window {
        	background-color: rgba(21, 37, 40, 0.9);
        }
        
        button {
            border-radius: 50px;
            border-color: #152528;
        	text-decoration-color: #007382;
            color: #007382;
        	background-color: #FFFCF9;
        	border-style: solid;
        	border-width: 1px;
        	background-repeat: no-repeat;
        	background-position: center;
        	background-size: 25%;
          padding: 10px;
        }
        
        button:focus, button:active, button:hover {
        	background-color: #D07364;
        	outline-style: none;
        }
        
        #lock {
            background-image: url("${self}/home/wlogout/lock.svg");
        }
        
        #logout {
            background-image: url("${self}/home/wlogout/logout.svg");
        }
        
        #suspend {
            background-image: url("${self}/home/wlogout/suspend.svg");
        }
        
        #hibernate {
            background-image: url("${self}/home/wlogout/hibernate.svg");
        }
        
        #shutdown {
            background-image: url("${self}/home/wlogout/shutdown.svg");
        }
        
        #reboot {
            background-image: url("${self}/home/wlogout/reboot.svg");
        }
      '';
    };
  };
}
