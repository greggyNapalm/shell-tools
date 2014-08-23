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
import datetime

logger = logging.getLogger('test_logger')
logger.setLevel(logging.DEBUG)

handler = graypy.GELFHandler('lunaport-log.haze.yandex.net', 12201)
logger.addHandler(handler)

#logger.debug('Hello Graylog2. py-src UDP')
adapter = logging.LoggerAdapter(logger, {
    'job': 'test_gelf_udp',
    'worker_version': '0.1.2',
})
adapter.info('Hello Graylog2. With additional fields. {}'.format(datetime.datetime.now()))

def main():
    print 'Done'

if __name__ == '__main__':
    main()
