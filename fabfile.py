#Fabric script for Deployment to Dokku
from fabric.api import *


def create_app(branch):
     try:
         run(''.join(('dokku apps:create ',branch,'-app')))
     except Error:
         print('something went wrong')
#    run(''.join(('dokku mariadb:create ',branch,'-db')))
#    run(''.join(('dokku mariadb:link ',branch,'-db ',branch,'-app')))
    

def push_to_dokku(branch):
    local(''.join(("git remote add test  dokku@dokku.riyoth.info:",branch)))
    local("git push test HEAD:master")

@hosts('root@dokku.riyoth.info')
@task
def deploy(branch):
    create_app(branch)
    push_to_dokku(branch)
