#!/usr/bin/env python
# (c) 2018 Krzysztof Magosa
# Send complains to krzysztof@magosa.pl
# SETUP:
#
# pip install --user ruamel.yaml

import sys
import subprocess
import ruamel.yaml

def default_constructor(loader, tag_suffix, node):
    p = subprocess.Popen(["ansible-vault", "decrypt"], stdin=subprocess.PIPE, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
    (stdout, stderr) = p.communicate(node.value)
    if p.returncode != 0:
        raise Exception("Problem with decoding: {}".format(stderr))
    return stdout

if __name__ == "__main__":
    if len(sys.argv) == 1 or sys.argv[1] == "-":
        handle = sys.stdin
    else:
        handle = open(sys.argv[1])
    yaml = ruamel.yaml.YAML()
    ruamel.yaml.add_multi_constructor("!vault", default_constructor, Loader=ruamel.yaml.SafeLoader)
    data = yaml.load(handle)
    yaml.indent(mapping=2, sequence=4, offset=2)
    yaml.width = 1000
    handle.close()
    yaml.dump(data, sys.stdout)
