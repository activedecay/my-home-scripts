#!/usr/bin/env python
import reviewboard
import argparse
prs = argparse.ArgumentParser()
prs.add_argument('-r', '--review', required=True)
args = prs.parse_args()
c = reviewboard.make_rbclient('https://reviews.sandisk.com', 'jfaust', 'Noiaser5')
print c._httpclient._http_request('GET', '/r/'+args.review+'/diff/raw/', None, None)
