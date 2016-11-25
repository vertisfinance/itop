import datetime
import subprocess
import os
import yaml
import logging
import logging.config


dir_path = os.path.dirname(os.path.realpath(__file__))
conf_path = os.path.join(dir_path, 'config.yaml')
logging.config.dictConfig(yaml.load(open(conf_path)))

errorlogger = logging.getLogger('error')
oklogger = logging.getLogger('ok')


def do_backup():
    now = datetime.datetime.now().strftime('%Y-%m-%d-%H-%M')
    backup_filename = 'itop-' + now + '.sql'
    compose_dir = '/opt/itop/environment/prod/'
    mysql_backup_dir = '/opt/itop/'
    backup_dest = 'myvertis@myvertis.com:/home/myvertis/itop.vertis.com-backup/'
    ssh_port = 20022
    mysql_container_name = 'mysql'
    backupfile_src = os.path.join(mysql_backup_dir, backup_filename)

    # Backup db
    retcode = subprocess.call(
        ['docker', 'exec', 'itop_mysql', 'sh', '-c',
        'exec mysqldump -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE"> itop.sql',
         ], cwd=compose_dir)
    if retcode != 0:
        errorlogger.error('Backup error')

    retcode = subprocess.call(
        ['docker', 'cp', 'itop_mysql:/itop.sql', backupfile_src,
         ], cwd=compose_dir)
    if retcode != 0:
        errorlogger.error('Backup error')
    # copy the backup file from container to a temporary destiniton
    # subprocess.check_call(
    #     ['docker', 'cp', full_src, dir_path],
    #     cwd=compose_dir)
    #
    # Commpress
    tgz = backup_filename + '.tgz'
    retcode = subprocess.call(
        ['tar', '-cvzf', tgz, backup_filename], cwd=mysql_backup_dir)
    if retcode != 0:
        errorlogger.error('commpress error')

    # upload the commpressed file
    src = os.path.join(mysql_backup_dir, tgz)
    retcode = subprocess.call(['scp', '-P', str(ssh_port), src, backup_dest])
    if retcode != 0:
        errorlogger.error('scp error')

    # delete temporary files
    retcode = subprocess.call(['rm', backup_filename, tgz],
                              cwd=mysql_backup_dir)
    if retcode != 0:
        errorlogger.error('Delete Backup temporyry folder error')

    # Delete backup from the container
    # for some unknown reason the rm command always return with 1 response code
    # TODO find out why? time spent until now: 1 hour
    subprocess.call(
        ['/usr/local/bin/docker-compose', 'exec', mysql_container_name, 'rm',
         'itop.sql'],
        cwd=compose_dir)


if __name__ == '__main__':
    try:
        do_backup()
    except Exception as e:
        errorlogger.exception(e)
    else:
        oklogger.info('Backup OK')
