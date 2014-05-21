#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
    app.module
    ~~~~~~~~~~~~~~~
    
    Some info about this module.
"""
import os
import logging
import graypy

my_logger = logging.getLogger('test_logger')
my_logger.setLevel(logging.DEBUG)

handler = graypy.GELFHandler('gelf.graylog.host', 12201)
my_logger.addHandler(handler)

my_logger.debug('Hello Graylog2.')

def main():
    print 'Done'

if __name__ == '__main__':
    main()
