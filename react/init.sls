installer:
  pkg.installed:
    - pkgs:
      - nodejs
      - npm
      - yarnpkg
# requires buster backports      - micro 
      - tmux

'npx create-react-app myproject':
  cmd.run:
    - runas: vagrant
    - unless: ls /home/vagrant|grep myproject
