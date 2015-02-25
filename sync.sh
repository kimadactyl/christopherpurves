#!/bin/sh
rsync -avze "ssh -p 60488"  --exclude=".htaccess" ./build/ christop@nurse.safesharkhosting.com:/home2/christop/public_html/ 