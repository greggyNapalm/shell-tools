#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
    app.module
    ~~~~~~~~~~~~~~~

    Some info about this module.
"""
import logging
from raven.handlers.logging import SentryHandler
from raven.conf import setup_logging
from raven import Client

# DSN_EXAMPLE = '{PROTOCOL}://{PUBLIC_KEY}:{SECRET_KEY}@{HOST}/{PATH}{PROJECT_ID}'
# use Youre own.

def crash():
    c = never_exists


def main():
    logger = logging.getLogger(__name__)
    adapter = logging.LoggerAdapter(logger, {
        'job': 'test_gelf_udp',
        'worker_version': '0.1.2',
    })

    client = Client(DSN)
    handler = SentryHandler(client)
    setup_logging(handler)

    try:
        crash()
    except Exception:
        adapter.error('Test script call, all fine.', exc_info=True)
    print 'Done'

if __name__ == '__main__':
    main()
