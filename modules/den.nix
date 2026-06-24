{ lib, ... }:
{
  den.hosts.x86_64-linux.nixreaper.users.nix = { };
  den.homes.x86_64-linux.nix = { };

  # enable hm for all users
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
