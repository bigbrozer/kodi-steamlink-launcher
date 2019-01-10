# Steamlink Launcher for Kodi

Plugin for [Kodi](https://kodi.tv/) to launch [Steamlink](https://steamcommunity.com/app/353380/discussions/6/2806204039992195182/).

## Requirements

* Raspbian >=9 already installed.

* Install `kodi` package:

  ```shell
  sudo apt-get update
  sudo apt-get install -y kodi
  ```

* A `kodi` user is created and used to start `kodi-standalone` service:

  ```shell
  sudo useradd -a -m -U -G "audio,bluetooth,input,plugdev,video" -s /bin/bash -u 999 kodi
  ```

* Systemd service unit is being installed to start `kodi-standalone` service:

  ```bash
  cat <<EOF | sudo tee /etc/systemd/system/kodi.service
  [Unit]
  Description = Kodi Media Center
  After = systemd-user-sessions.service network.target sound.target

  [Service]
  User = kodi
  Group = kodi
  Type = simple
  ExecStart = /usr/bin/kodi-standalone
  Restart = always
  RestartSec = 15

  [Install]
  WantedBy = multi-user.target
  EOF

  sudo systemctl daemon-reload
  sudo systemctl enable kodi
  sudo systemctl start kodi
  ```

* Install [steamlink](https://steamcommunity.com/app/353380/discussions/0/1743353164093954254) debian package with:

  ```shell
  sudo apt-get update
  sudo apt-get install -y steamlink
  ```

## Plugin installation

* Log into ssh on your Kodi installation.

* Download the [zip](https://github.com/bigbrozer/kodi-steamlink-launcher/releases) of the launcher and install it via Kodi (*Extension → Install from Zip file*). You must **allow untrusted sources** in system settings prior to this.

* Setup sudo rules to allow `kodi` user to run steamlink:

  ```bash
  cat <<EOF | sudo tee /etc/sudoers.d/steamlink-kodi
  kodi ALL=(root) NOPASSWD: /bin/systemctl stop kodi, /bin/systemctl restart kodi, /bin/openvt
  EOF
  ```

## Want to contribute ?

Submit your contributions through [pull requests](https://help.github.com/articles/about-pull-requests/).

## Acknowledgement

```plain
Steam Copyright 2003-2018 Valve Corp. All rights reserved. Use of Steam Link software is subject to the Steam Subscriber Agreement, https://store.steampowered.com/subscriber_agreement/.
```

## Inspiration

* [grimlokason/osmc-steamlink](https://gitlab.com/grimlokason/osmc-steamlink) - scripting logic
* [swetoast/steamlink-launcher](https://github.com/swetoast/steamlink-launcher) - addon resources

## License

Steamlink Launcher for Kodi is licensed under GPLv2, see `LICENSE.txt`.
