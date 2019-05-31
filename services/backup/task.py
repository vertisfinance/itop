#!/usr/bin/env python3

import logging
import os

from periodtask import TaskList, Task, RUN
from periodtask.mailsender import MailSender


logging.basicConfig(
    level=getattr(logging, os.environ.get('LOG_LEVEL', 'INFO')),
    format='%(levelname)s|%(name)s|%(asctime)s|%(message)s'
)

send = MailSender(
    os.environ['EMAIL_HOST'],
    int(os.environ['EMAIL_PORT']),
    os.environ['EMAIL_FROM'],
    os.environ['EMAIL_RECIPIENT'],
).send_mail

tasklist = []

###############################################################################
if os.environ.get('BACKUP') == 'True':
    tasklist.append(
        Task(
            "Backup",
            ('bash', '/backup.sh',),
            os.environ.get('BACKUP_CRON', '0 0 18 * * * Europe/Budapest'),
            run_on_start=os.environ.get('BACKUP_RUN_ON_START') == 'True',
            policy=RUN,
            max_lines=None,
            stdout_level=logging.DEBUG,
            stderr_level=logging.DEBUG,
            mail_success=None,
            mail_failure=send
        )
    )


if __name__ == '__main__':
    TaskList(*tasklist).start()
