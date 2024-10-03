{ config, lib, pkgs, ... }:

{
  # Show GDM on my main screen (and not the TV)
  systemd.tmpfiles.rules = [
    "L+ /run/gdm/.config/monitors.xml - - - - ${pkgs.writeText "gdm-monitors.xml" ''
      <!-- this should all be copied from your ~/.config/monitors.xml -->
      <monitors version="2">
        <configuration>
          <logicalmonitor>
            <x>0</x>
            <y>0</y>
            <scale>1</scale>
            <primary>yes</primary>
            <monitor>
              <monitorspec>
                <connector>DP-1</connector>
                <vendor>DEL</vendor>
                <product>DELL S3422DWG</product>
                <serial>1WS0T63</serial>
              </monitorspec>
              <mode>
                <width>3440</width>
                <height>1440</height>
                <rate>143.975</rate>
              </mode>
            </monitor>
          </logicalmonitor>
          <disabled>
            <monitorspec>
              <connector>HDMI-1</connector>
              <vendor>TCL</vendor>
              <product>Beyond TV</product>
              <serial>0x00010000</serial>
            </monitorspec>
          </disabled>
        </configuration>
      </monitors>
    ''}"
  ];
}