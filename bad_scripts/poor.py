import os
import sys
import pyspark
from pyspark.sql import SparkSession
import paramiko

SSH_USERNAME = 'admin'
SSH_PASSWORD = 'password123'

def insecure_ssh_connection(host):
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(host, username=SSH_USERNAME, password=SSH_PASSWORD)
    stdin,
