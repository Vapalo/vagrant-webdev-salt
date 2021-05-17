/etc/apt/sources.list.d/vbox.list:
  file.managed:
    - source: salt://vbox/vbox.list

/etc/apt/trusted.gpg.d/oracle.gpg:
  file.managed:
    - source: salt://vbox/oracle.gpg

virtualbox-6.0:
  pkg.installed

vagrant:
  pkg.installed
