#!/usr/bin/env python
#  xkcd.py
#  
#  Copyright 2012 Benjamin Kaiser <benkaiser@benkaiser>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
import urllib, os, re, json

def main():
    # remove, make and move into the XKCD_IMAGES directory
    if not os.path.isdir('JSON'):
        os.mkdir('JSON');
    safeDelMove('XKCD_IMAGES')
    upto = getUpto()
    num = getCurrent()
    
    for cnt in range(upto, num+1):
        if cnt == 404:
            continue
        getImg(cnt)
    
    return 0

def getCurrent():
    
    print "Fetching home page: trying to identify latest number"
    # put the homepage into a BeautifulSoup
    f = urllib.urlopen("http://xkcd.com/info.0.json")
    s = f.read()
    f.close()
    latest = json.loads(s)
    print "Found latest comic was: " + str(latest['num'])
    return int(latest['num']);

def getImg(number):
    strNum = str(number)
    print "Getting image for comic: " + strNum
    # extract the image url from the page
    f = urllib.urlopen("http://xkcd.com/"+strNum+"/info.0.json")
    comics = f.read()
    f.close()
    comic = json.loads(comics)
    # clean up the url
    imgUrl = comic['img'];
    ext = imgUrl.split('.')[-1]
    # download the img
    filename = strNum + "." + ext
    urllib.urlretrieve(imgUrl, filename)
    # write the raw json data
    f = open("../JSON/"+strNum+".json",'w')
    f.write(comics)
    f.close()

    print "Successfully downloaded:  " + strNum

def safeDelMove(s):
    if not os.path.isdir(s):
        os.mkdir(s);
    os.chdir(s)

def getUpto():
    upto = 0
    dirs = os.listdir('.')
    for f in dirs:
        x = int(re.sub(r"\..+", "", f))
        if x > upto:
            upto = x
    return upto+1

if __name__ == '__main__':
    main()
