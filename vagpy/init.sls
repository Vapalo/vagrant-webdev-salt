requirements:
  pkg.installed:
    - pkgs:
      - apache2
      - postgresql
      - python3-flask
      - python3-flask-sqlalchemy
      - python3-psycopg2
      - libapache2-mod-wsgi-py3
      - micro


/home/vagrant/public_wsgi:
  file.directory:
    - name: /home/vagrant/public_wsgi
    - user: vagrant
    - group: vagrant
    - mode: 755

/home/vagrant/public_wsgi/testing.py:
  file.managed:
    - source: salt://vagpy/testing.py
    - user: vagrant
    - group: vagrant
    - file_mode: 644

/home/vagrant/public_wsgi/templates:
  file.directory:
    - name: /home/vagrant/public_wsgi/templates
    - user: vagrant
    - group: vagrant
    - mode: 755

/home/vagrant/public_wsgi/templates/home.html:
  file.managed:
    - source: salt://vagpy/home.html
    - user: vagrant
    - group: vagrant
    - file_mode: 644


/home/vagrant/public_wsgi/production.py:
  file.managed:
    - source: salt://vagpy/production.py
    - user: vagrant
    - group: vagrant
    - file_mode: 644

/etc/apache2/sites-available/prod.conf:
  file.managed:
    - source: salt://vagpy/prod.conf

/home/vagrant/public_wsgi/prod.wsgi:
  file.managed:
    - source: salt://vagpy/prod.wsgi
    - user: vagrant
    - group: vagrant
    - file_mode: 644

'a2dissite 000-default.conf':
  cmd.run

'a2ensite prod.conf':
  cmd.run

'systemctl restart apache2':
  cmd.run


'createuser vagrant && createdb vagrant':
  cmd.run:
    - runas: postgres
    - unless: 'psql -c "\du"|grep vagrant'

'psql -c "CREATE TABLE employees(id serial primary key, name varchar(250), address varchar(250))"':
  cmd.run:
    - runas: vagrant
    - unless: 'psql -c "\d"|grep employees'

psql -c "INSERT INTO employees (name,address) VALUES ('Matti Meikäläinen', 'Testikatu123')":
  cmd.run:
    - runas: vagrant
    - unless: 'psql -c "SELECT * FROM employees;"|grep Matti'
