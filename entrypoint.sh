#!/bin/bash
set -e

# Démarrer SSH
/usr/sbin/sshd

# Démarrer Gunicorn
exec gunicorn app.main:app --bind 0.0.0.0:8000
