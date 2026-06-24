{
  den,
  libs,
  ...
}:
{
  den.aspects.system = {
    includes = [
      den.aspects.limine
      den.aspects.kernel
      den.aspects.filesystem
      den.aspects.power
      den.aspects.sound
      den.aspects.network
      den.aspects.nvidia
    ];
  };
}
