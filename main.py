#!/usr/local/bin/python
# -*- coding: utf-8 -*-

""" My Footmaker

Save data inputed comment.
"""

import os
import logging
from datetime import date
from datetime import datetime
from bottle import route
from bottle import run
from bottle import request
from bottle import template
import config

@route("/diary")
def display_main():
    return template("./views/diary.tpl",
                    messages=[]
                    )

@route("/diary", method="post")
def save():
    req = _parse_request()
    comment = _awk_comment(req["comment"])
    _write_file(comment)
    _write_log()
    return template("./views/diary.tpl",
                    messages=["投稿完了!!"]
                    )

def _parse_request():
    req = {}
    for k, v in request.forms.items():
        req[k] = v
    return req

def _write_file(comment):
    today = date.today()
    name = today.strftime("%Y%m%d")
    full_path = os.path.join(config.SAVE_DIR, name)
    with open(full_path, "a") as f:
        print comment
        f.write(comment)

def _awk_comment(comment):
    now = datetime.now().strftime("%Y%m%d%H%M%S")
    cast_comment = "{header}\n{body}\n\n".format(header=now,
                                               body=comment)
    return cast_comment

def _write_log():
    log_path = os.path.join(config.LOG_DIR, "submit.log")
    logging.basicConfig(filename=log_path,
                        level=logging.DEBUG,
                        format="%(asctime)s:%(message)s")
    logging.info("submit message")

if __name__ == "__main__":
    run(host='localhost', port=8080, debug=True)
