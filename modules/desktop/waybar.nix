{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
      /* -----------------------------------------------------
       * Define colors
       * ----------------------------------------------------- */

      @define-color white #ffffff;
      @define-color grey #cccccc;
      @define-color black #000000;

      /* -----------------------------------------------------
       * General
       * ----------------------------------------------------- */

      * {
        font-family: "Fira Sans Semibold", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
        border: none;
        border-radius: 0px;
      }

      window#waybar {
        background-color: rgba(0, 0, 0, 0.8);
        border-bottom: 0px solid @white;
        background: transparent;
        transition-property: background-color;
        transition-duration: .5s;
      }

      /* -----------------------------------------------------
       * Workspaces
       * ----------------------------------------------------- */

      #workspaces {
        margin: 2px 1px 3px 1px;
        padding: 0px 1px;
        border-radius: 15px;
        border: 0px;
        font-weight: bold;
        font-style: normal;
        font-size: 16px;
        color: @white;
        background: @white;
        opacity: 0.8;
      }

      #workspaces button {
        padding: 0px 5px;
        margin: 4px 3px;
        border-radius: 15px;
        border: 0px;
        color: @black;
        background-color: @grey;
        opacity: 0.4;
        transition: all 0.5s ease-in-out;
      }

      #workspaces button.active {
        color: @black;
        background-color: @grey;
        opacity: 1.0;
        border-radius: 15px;
        min-width: 40px;
        transition: all 0.5s ease-in-out;
      }

      #workspaces button:hover {
        color: @black;
        background-color: @grey;
        opacity: 0.7;
        border-radius: 15px;
      }

      /* -----------------------------------------------------
       * Tooltips
       * ----------------------------------------------------- */

      tooltip {
        border-radius: 10px;
        background-color: @grey;
        opacity: 0.8;
        padding: 20px;
        margin: 0px;
      }

      tooltip label {
        color: @black;
      }

      /* -----------------------------------------------------
       * Windows
       * ----------------------------------------------------- */

      #window {
        background: @grey;
        margin: 5px 15px 5px 0px;
        padding: 2px 10px 0px 10px;
        border-radius: 12px;
        color: @black;
        font-size: 16px;
        font-weight: normal;
        opacity: 0.8;
      }

      window#waybar.empty #window {
        background-color: transparent;
      }

      /* -----------------------------------------------------
       * Taskbar
       * ----------------------------------------------------- */

      #taskbar {
        background: @grey;
        margin: 3px 15px 3px 0px;
        padding: 0px;
        border-radius: 15px;
        font-weight: normal;
        font-style: normal;
        opacity: 0.8;
        border: 3px solid @grey;
      }

      #taskbar button {
        margin: 0;
        border-radius: 15px;
        padding: 0px 5px 0px 5px;
      }

      #taskbar.empty {
        background: transparent;
        margin: 0;
        padding: 0;
        border: 0;
      }

      /* -----------------------------------------------------
       * Modules
       * ----------------------------------------------------- */

      .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
      }

      .margin-right > widget:last-child > #workspaces {
        margin-right: 0;
      }

      /* -----------------------------------------------------
       * Custom Quicklinks
       * ----------------------------------------------------- */

      #custom-brave,
      #custom-browser,
      #custom-keybindings,
      #custom-outlook,
      #custom-filemanager,
      #custom-teams,
      #custom-chatgpt,
      #custom-calculator,
      #custom-windowsvm,
      #custom-cliphist,
      #custom-wallpaper,
      #custom-settings,
      #custom-wallpaper,
      #custom-system,
      #custom-hyprshade,
      #custom-hypridle,
      #custom-tools,
      #custom-quicklink1,
      #custom-quicklink2,
      #custom-quicklink3,
      #custom-quicklink4,
      #custom-quicklink5,
      #custom-quicklink6,
      #custom-quicklink7,
      #custom-quicklink8,
      #custom-quicklink9,
      #custom-quicklink10,
      #custom-waybarthemes {
        margin: 0px 15px 0px 0px;
        font-size: 20px;
        font-weight: bold;
        opacity: 0.8;
        color: @grey;
      }

      #custom-tools {
        margin-right: 12px;
      }

      #custom-hypridle {
        margin-right: 12px;
      }

      #custom-hypridle.active {
        color: @grey;
      }

      #custom-hypridle.notactive {
        color: @inactiveIconColor;
      }

      #custom-settings {
        margin-right: 15px;
      }

      #custom-browser {
        margin-right: 12px;
      }

      #custom-wallpaper {
        margin-right: 14px;
      }

      #custom-chatgpt {
        margin-right: 10px;
        background-image: url("../assets/ai-icon-20.png");
        background-repeat: no-repeat;
        background-position: center;
        padding-right: 23px;
      }

      #custom-waybarthemes,
      #custom-system {
        margin-right: 15px;
      }

      /* -----------------------------------------------------
       * Idle Inhibator
       * ----------------------------------------------------- */

      #idle_inhibitor {
        margin-right: 15px;
        font-size: 16px;
        font-weight: bold;
        color: @grey;
      }

      #idle_inhibitor.activated {
        margin-right: 15px;
        font-size: 14px;
        font-weight: bold;
        color: @inactiveColorIcon;
      }

      /* -----------------------------------------------------
       * Idle Inhibator
       * ----------------------------------------------------- */

      #custom-appmenuicon {
        font-size: 20px;
        color: @textcolor;
        margin: 0px 15px 0px 0px;
      }


      /* -----------------------------------------------------
       * Custom Exit
       * ----------------------------------------------------- */

      #custom-exit {
        margin: 0px 13px 0px 0px;
        padding: 0px;
        font-size: 20px;
        color: @grey;
        opacity: 0.8;
      }


      /* -----------------------------------------------------
       * Custom Exit
       * ----------------------------------------------------- */

      #custom-youtube {
        background-color: @background;
        font-size: 14px;
        color: @textColor2;
        border-radius: 15px;
        margin: 0px 15px 0px 0px;
      }


      /* -----------------------------------------------------
       * Hardware Group
       * ----------------------------------------------------- */

      #disk,
      #memory,
      #cpu,
      #language {
        margin: 0px;
        padding: 0px;
        font-size: 16px;
        color: @grey;
      }

      #language {
        margin-right: 10px;
      }

      /* -----------------------------------------------------
       * Clock
       * ----------------------------------------------------- */

      #clock {
        background-color: @black;
        font-size: 16px;
        color: @grey;
        border-radius: 15px;
        padding: 1px 10px 0px 10px;
        margin: 3px 0px 3px 0px;
        opacity: 0.8;
      }

      /* -----------------------------------------------------
       * Backlight
       * ----------------------------------------------------- */

      #backlight {
        font-size: 14px;
        color: @textColor1;
        border-radius: 15px;
        margin: 0px 15px 0px 0px;
        background-color: transparent;
      }

      /* -----------------------------------------------------
       * PulseAudio
       * ----------------------------------------------------- */

      #pulseaudio {
        background-color: @grey;
        font-size: 16px;
        color: @black;
        border-radius: 15px;
        margin: 5px 15px 5px 0px;
        padding: 2px 10px 0px 10px;
        opacity: 0.8;
      }

      #pulseaudio.muted {
        background-color: @black;
        color: @grey;
      }

      /* -----------------------------------------------------
       * Network
       * ----------------------------------------------------- */

      #network {
        background-color: @grey;
        color: @black;
        font-size: 16px;
        margin: 5px 15px 5px 0px;
        padding: 2px 10px 0px 10px;
        border-radius: 15px;
        opacity: 0.8;
      }

      #network.ethernet {
        color: @black;
      }

      #network.wifi {
        color: @black;
      }

      /* -----------------------------------------------------
       * Bluetooth
       * ----------------------------------------------------- */

      #bluetooth,
      #blutooth.on
      #bluetooth.connected {
        background-color: @grey;
        color: @black;
        font-size: 16px;
        border-radius: 15px;
        margin: 5px 15px 5px 0px;
        padding: 2px 10px 0px 10px;
        opacity: 0.8;
      }

      #bluetooth.off {
        background-color: transparent;
        padding: 0px;
        margin: 0px;
      }


      /* -----------------------------------------------------
       * Tray
       * ----------------------------------------------------- */

      #tray {
        margin: 0px 15px 0px 0px;
      }


      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
      }
    '';
    settings = [{
      "layer" = "top";
      "margin-top" = 14;
      "margin-bottom" = 0;
      "margin-left" = 14;
      "margin-right" = 14;
      "spacing" = 0;
      modules-left = [
        "wlr/taskbar"
        "hyprland/window"
      ];
      modules-center = [
        "hyprland/workspaces"
      ];
      modules-right = [
        "pulseaudio"
        "bluetooth"
        "network"
        "group/hardware"
        "tray"
        "custom/exit"
        "clock"
      ];
      "wlr/taskbar" = {
        "on-click" = "activate";
      };
      "pulseaudio" = {
        "format" = "{icon}   {volume}%";
        "format-bluetooth" = "{volume}% {icon} {format_source}";
        "format-bluetooth-muted" = " {icon} {format_source}";
        "format-muted" = " {format_source}";
        "format-source" = "{volume}% ";
        "format-source-muted" = "";
        "format-icons" = {
          "headphone" = " ";
          "hands-free" = " ";
          "headset" = " ";
          "phone" = " ";
          "portable" = " ";
          "car" = " ";
          "default" = ["" "" ""];
        };
        "on-click" = "pavucontrol";
      };
      "bluetooth" = {
        "on-click" = "blueman-manager";
      };
      "tray" = {
        "icon-size" = 21;
        "spacing" = 10;
      };
      "network" = {
        "format" = "{ifname}";
        "format-wifi" = "   {signalStrength}%";
        "format-ethernet" = "{ifname}";
        "format-disconnected" = "Disconnected";
        "tooltip-format" = "{ifname} via {gwaddri}";
        "tooltip-format-wifi" = "   {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
        "tooltip-format-ethernet" = "{ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}";
        "tooltip-format-disconnected" = "Disconnected";
        "max-length" = 50;
      };
      "custom/system" = {
        "format" = "🗠";
        "tooltip" = false;
      };
      "cpu" = {
        "format" = "/ C {usage}% ";
        "on-click" = "alacritty --class dotfiles-floating -e htop";
      };
      "memory" = {
        "format" = "/ M {}%";
        "on-click" = "alacritty --class dotfiles-floating -e htop";
      };
      "disk" = {
        "format" = "D {percentage_used}% ";
        "on-click" = "alacritty --class dotfiles-floating -e htop";
      };
      "group/hardware" = {
        "orientation" = "inherit";
        "drawer" = {
          "transition-duration" = 300;
          "children-class" = "not-memory";
          "transition-left-to-right" = false;
        };
        "modules" = [ "custom/system" "disk" "cpu" "memory" ];
      };
      "custom/exit" = {
        "format" = "";
        "on-click" = "wlogout";
        "tooltip-format" = "Power Menu";
      };
      "clock" = {
        "format" = "{:%H:%M %a}";
        "tooltip" = false;
      };
    }];
  };
}
