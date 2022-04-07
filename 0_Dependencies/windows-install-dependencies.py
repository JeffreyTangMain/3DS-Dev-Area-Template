# This is meant to be double-clicked from File Explorer.

# This doesn't import pip as a module in case the way it's executed changes, which it has in the past.
# Instead we call it like we would in the command line.

from subprocess import run
from os.path import dirname, join
from sys import executable

root_dir = dirname(__file__)

run([executable, '-m', 'pip', 'install', '--user', '-r', join(root_dir, 'requirements-win32.txt')])
input('Press enter to close')
