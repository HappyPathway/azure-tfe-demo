#!/usr/local/bin/python
import requests
import os
import json
import sys
import hcl

def hcl_config(api, config):
    with open(os.path.abspath(config), 'r') as fp:
        obj = hcl.load(fp)
    return obj.get('credentials').get(api).get('token')

def main(opt):
    # stdin_json = json.loads(sys.stdin.read())
    atlas_token = hcl_config(opt.api, opt.config)

    headers = {"Authorization": "Bearer {0}".format(atlas_token)}
 
    resp = requests.get("https://{0}/api/v2/organizations/{1}/oauth-tokens".format(opt.api, opt.org), headers=headers)
    data = resp.json()
    try:
        print "Token: {0}".format(data.get("data")[0].get("id"))
    except:
        print "Could not find Token. Have you connected your VCS?"
        print "Please go to: https://app.terraform.io/app/{0}/settings/version-control".format(opt.org)
        if "y" in raw_input("Open Browser? "):
            os.system("open https://app.terraform.io/app/{0}/settings/version-control".format(opt.org))
            
if __name__ == '__main__':
    from optparse import OptionParser
    parser = OptionParser()
    parser.add_option('--config', default=os.path.expanduser("~/.terraformrc"))
    parser.add_option('--org')
    parser.add_option('--api', default="app.terraform.io")
    opt, args = parser.parse_args()
    main(opt)

