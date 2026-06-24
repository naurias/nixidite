{
  den,
  libs,
  virt,
  de, 
  ...
}:
{
  den.aspects.components = {
    includes = [
      den.aspects.keyboards
      den.aspects.zsh
      den.aspects.zsh._.environment
      #den.aspects.kanata
      den.aspects.packages
      den.aspects.packages._.pkconf
      virt.main
      virt.main._.podman
      de.desktop
      den.aspects.gaming
      den.aspects.stylix
    ];
  };
}
