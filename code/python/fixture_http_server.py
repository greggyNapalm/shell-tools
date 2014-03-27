#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
    lunaport.fixture-server
    ~~~~~~~~~~~~~~~~~~~~~~~

    Dummy Web server for testing proposes.
    Use in load testing VM farm to emulate target.
"""
import os
from time import sleep

import tornado.ioloop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
    def get(self, *args, **kw):
        """
        curl -v "http://localhost:8888/201/50/2"
        """
        sleep_ms = kw.get('sleep_ms') or None  # in milliseconds
        status_code = kw.get('status_code') or 200
        body_size = kw.get('body_size') or None  # in bytes

        self.set_status(int(status_code))
        if sleep_ms:
            sleep(int(sleep_ms) / 1000)
        body = ''
        if body_size:
            body = os.urandom(int(body_size))

        self.write(body)

application = tornado.web.Application([
    (r"/(?P<status_code>[^\/]+)/?(?P<sleep_ms>[^\/]+)?/?(?P<body_size>[^\/]+)?", MainHandler),
])

if __name__ == "__main__":
    application.listen(8888)
    tornado.ioloop.IOLoop.instance().start()
