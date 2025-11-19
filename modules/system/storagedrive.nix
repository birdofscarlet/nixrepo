{ config, ... }:

{

  fileSystems."~/storage-drive" = {

    device = "/dev/nvme0n1";
    fsType = "auto";

  };

}