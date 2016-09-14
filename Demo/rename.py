#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os
import subprocess

if len(sys.argv) != 2:
    print 'Please Enter ProjectName'
    sys.exit()

for root, dirs, files in os.walk('.'):
    for filename in files:
        if root.find("Pods") == -1 and root.find(".git") == -1:
            filepath = os.path.join(root, filename)
            if filepath.find('rename.py') != -1:
                continue

            content = open(filepath).read()

            if 'Example' in content:
                content = content.replace('Example', sys.argv[1])
                with open(filepath, 'w') as f:
                    f.write(content)

            if filename.find('Example') != -1:
                newfilename = filename.replace("Example", sys.argv[1])
                newfilepath = os.path.join(root, newfilename)
                os.system("mv %s %s" % (filepath, newfilepath))

for root, dirs, files in os.walk('.'):
    if root.find("Pods") == -1 and root.find(".git") == -1:
        for directory in dirs:
            if directory.find('Example') != -1:
                filepath = os.path.join(root, directory)
                newdir = directory.replace("Example", sys.argv[1])
                newfilepath = os.path.join(root, newdir)
                os.system("mv %s %s" % (filepath, newfilepath))

print 'Done! %s' % sys.argv[1]
