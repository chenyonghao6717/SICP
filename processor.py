"""
usage: 1. import: python3 processor.py --import <path>
       2. clear-import python3 processor.py --clear-import
"""

import sys
import os
from typing import List

IMPORT_START = '; --------------- IMPORT STARTS ---------------\n'
IMPORT_END = '\n; --------------- IMPORT ENDS ---------------\n'
IMPORTED_FILE_SUFFIX = "_imported.scm"

def write(lines: List[str], path):
  with open(path, 'w') as file:
    file.writelines(lines)

def import_lib_in_file(path: str):
  output_lines: List[str] = []
  with open(path) as file:
    lines = file.readlines()
  for line in lines:
    if not line.startswith(';') or not 'import' in line:
      output_lines.append(line)
      continue
    lib_file_path = os.path.join('lib', line.replace(';', '').replace('import', '').replace(' ', ''))
    with open(lib_file_path, 'r') as lib:
      lib_lines = lib.readlines()
      lines.append(IMPORT_START)
      lines.extend(lib_lines)
      lines.append(IMPORT_END)
  write(output_lines, path.replace('.scm', IMPORTED_FILE_SUFFIX))

def import_lib(path):
  files = os.listdir(path)
  for file in files:
    file_path = os.path.join(path, file)
    if os.path.isfile(file_path):
      import_lib_in_file(file_path)
    else:
      import_lib(file_path)

def clear_import(path):
  if os.path.isfile(path):
    return
  files = os.listdir(path)
  for file in files:
    file_path = os.path.join(path, file)
    if (os.path.isdir(file_path)):
      clear_import(file_path)
    elif file.endswith(IMPORTED_FILE_SUFFIX):
      os.remove(file_path)
      

IMPORT = "--import"
CLEAR_IMPORT = "--clear-import"
TYPE = sys.argv[1]
if TYPE == IMPORT:
  import_lib(sys.argv[2])
elif TYPE == CLEAR_IMPORT:
  clear_import('.')
  