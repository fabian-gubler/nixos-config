{ pkgs, config, ... }:
let
  # TODO: Make pure (remove hardcoding)
  urlStore = "${config.home.homeDirectory}/.dotfiles/modules/programs/calendar/files/get-url.sh";
  usernameStore = "${config.home.homeDirectory}/.dotfiles/modules/programs/calendar/files/get-username.sh";
  passStore = ''rbw", "get", "hosting'';

in
{
  imports = [
    ./modules/vdirsyncer.nix
  ];

  programs.zsh.shellAliases."vsync" = "vdirsyncer -c ${config.services.vdirsyncer.configFile}";

  services.vdirsyncer = {
    enable = true;
    settings = {
      general."status_path" = "${config.home.homeDirectory}/.config/vdirsyncer";
      "pair calendars" = {
        a = "calendar_local";
        b = "calendar_remote";
        collections = [ "from a" "from b" ];
        metadata = [ "color" "displayname" ];
      };
      "storage calendar_local" = {
        type = "filesystem";
        path = "/home/fabian/nextcloud/.calendars";
        fileext = ".ics";
      };
      "storage calendar_remote" = {
        type = "caldav";
        "url.fetch" = [ "command" "${urlStore}" ];
        "username.fetch" = [ "command" "${usernameStore}" ];
        "password.fetch" = [ "command" "${passStore}" ];
      };
      "pair my_contacts" = {
        a = "contacts_local";
        b = "contacts_remote";
        collections = [ "from a" "from b" ];
      };
      "storage contacts_local" = {
        type = "filesystem";
        path = "${config.home.homeDirectory}/nextcloud/.contacts/";
        fileext = ".vcf";
      };
      "storage contacts_remote" = {
        type = "carddav";
        "url.fetch" = [ "command" "${urlStore}" ];
        "username.fetch" = [ "command" "${usernameStore}" ];
        "password.fetch" = [ "command" "${passStore}" ];
      };
    };
  };
}