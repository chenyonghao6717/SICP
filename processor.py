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

def read_all_import_codes(path: str, imported: List[str]) -> List[str]:
  if path in imported:
    return []
  output_lines: List[str] = []
  with open(path, "r") as f:
    lines = f.readlines()
  for line in lines:
    if not line.startswith(';') or not 'import' in line:
      output_lines.append(line)
      continue
    lib_file_path = line.replace(';', '').replace('import', '').replace(' ', '').replace('\n', '')
    output_lines.extend(read_all_import_codes(lib_file_path, imported))
    imported.append(lib_file_path)
  return output_lines

def import_lib_in_file(path: str):
  if IMPORTED_FILE_SUFFIX in path:
    return
  with open(path, "r") as f:
    file_lines = f.readlines()
  has_import = False
  for file_line in file_lines:
    if file_line.startswith(";") and "import" in file_line:
      has_import = True
      break
  if not has_import:
    return
  output_lines = read_all_import_codes(path, [])
  with open(path.replace('.scm', IMPORTED_FILE_SUFFIX), "w") as file:
    file.writelines(output_lines)

def import_lib(path: str):
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
  