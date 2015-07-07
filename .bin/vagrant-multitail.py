#! /usr/bin/env python

import sys
import subprocess

if __name__ == '__main__':
    try:
        files = sys.argv[1]
    except:
        files = '/var/log/*.log'

    entries = subprocess.check_output(['vagrant', 'global-status']).decode('utf-8').split("\n")
    args = []
    for entry in entries:
        if 'running' not in entry:
            continue

        args.append("-L 'vagrant ssh {} -c \"sudo tail -f {}\"'".format(entry.split()[0], files))

    subprocess.call('multitail {}'.format(' '.join(args)), shell=True)
