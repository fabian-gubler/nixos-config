{ pkgs, ... }: {
  programs.autorandr = {
    enable = true;
    profiles = {
      "monitor" = {
        fingerprint = {
          DP-3-1 = "00ffffffffffff001e6dd776aec602000c18010380502278eaca95a6554ea1260f50542108007140818081c0a9c0b300d1c0810001019d6770a0d0a0225030203a00204f3100001a000000fd00383d1e5a1e000a202020202020000000fc003334554d39350a2020202020200000000000000000000000000000000000000184020317f14410040301230907078301000065030c0010009f3d70a0d0a0155030203a00204f3100001a7e4800e0a0381f4040403a00204f31000018011d007251d01e206e285500204f3100001e8c0ad08a20e02d10103e9600204f31000018000000ff003431324b4b555235423933340a0000000000000000000000000000ac";
          eDP-1 = "00ffffffffffff000dae491200000000071e0104a51a117803ee95a3544c99260f505400000001010101010101010101010101010101414080a0700026503020a60003ac10000018000000fe004e3132334e43412d4753310a20000000fe00434d4e0a202020202020202020000000fe004e3132334e43412d4753310a20002d";
        };
        config = {
          eDP-1.enable = false;
          DP-3-1 = {
            enable = true;
            crtc = 0;
            mode = "3440x1440";
            position = "0x0";
            primary = true;
            rate = "49.99";
          };
        };
      };
      laptop = {
        fingerprint = {
          DP-3-1 = "00ffffffffffff001e6dd776aec602000c18010380502278eaca95a6554ea1260f50542108007140818081c0a9c0b300d1c0810001019d6770a0d0a0225030203a00204f3100001a000000fd00383d1e5a1e000a202020202020000000fc003334554d39350a2020202020200000000000000000000000000000000000000184020317f14410040301230907078301000065030c0010009f3d70a0d0a0155030203a00204f3100001a7e4800e0a0381f4040403a00204f31000018011d007251d01e206e285500204f3100001e8c0ad08a20e02d10103e9600204f31000018000000ff003431324b4b555235423933340a0000000000000000000000000000ac";
          eDP-1 = "00ffffffffffff000dae491200000000071e0104a51a117803ee95a3544c99260f505400000001010101010101010101010101010101414080a0700026503020a60003ac10000018000000fe004e3132334e43412d4753310a20000000fe00434d4e0a202020202020202020000000fe004e3132334e43412d4753310a20002d";
        };
        config = {
          DP-3-1.enable = false;
          eDP-1 = {
            enable = true;
            crtc = 0;
            mode = "1920x1280";
            position = "0x0";
            primary = true;
            rate = "60.00";
          };
        };
      };
      # hooks.postswitch = readFile ./postswitch; # Need to import builtin function
    };
  };
}
