# Change working directory so relative paths (and template lookup) work again
import sys, os

dirpath = os.path.dirname(os.path.abspath(__file__))
sys.path.append(dirpath)
os.chdir(dirpath)
#os.chdir(os.path.dirname(__file__))

import bottle
import main
# ... build or import your bottle application here ...
# Do NOT use bottle.run() with mod_wsgi
application = bottle.default_app()
