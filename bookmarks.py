#!/usr/bin/env python

import glob
import json
import os

theBookmarkList = list()

# gets firefox bookmarks.
for f in glob.glob('/home/jfaust/.mozilla/firefox/*/bookmarkbackups/*'):
	try:
		x = json.loads(open(f).read())
		theBookmarkList.extend([lmnop['uri'] for lmnop in [z['children'] for z in x['children']][3]])
	except:
		pass

# gets the chromium bookmarks
if os.path.isfile('/home/jfaust/.config/chromium/Default/Bookmarks'):
	try:
		chromeMarks = open('/home/jfaust/.config/chromium/Default/Bookmarks')
		try:
			j = json.loads(chromeMarks.read())
			theBookmarkList.extend(	[i['url'] for i in j['roots']['other']['children']])
		except:
			pass
	except:
		pass

print list(set(theBookmarkList))
