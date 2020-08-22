{ pkgs, ...}:

{
  config = {
    home-manager.users.rafiyq = { pkgs, ...}: {
      programs.git = {
        enable = true;
        userEmail = "rafiyqw@tutanota.com";
        userName = "Rafiyq Widianto";
      };
    };
  };
}
