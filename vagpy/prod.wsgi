import sys
assert sys.version_info.major >=3, "Python version is too old"

sys.path.insert(0, '/home/vagrant/public_wsgi/')
from production import app as application
