#!/usr/bin/env python
import subprocess
import sys
import os
import click
import re

profiles = {
        "github": ["balanici_vitalik@mail.ru", "vitdevelop"],
        "hato": ["vitalie@hato.global", "Vitalie"]
        }

@click.group()
def cli():
    pass

@cli.command(help = 'Change profile')
@click.argument('profile')
@click.pass_context
def set(ctx, profile):
    if profile in profiles:
        user_data = profiles[profile]
        subprocess.run([f'git config --global user.email {user_data[0]}'], shell=True)
        subprocess.run([f'git config --global user.name {user_data[1]}'], shell=True)

        # check profile
        ctx.invoke(status)
    else:
        print("Profile not found.")

@cli.command(help = 'Show current user')
def status():
    gitconfig = os.path.expanduser("~/.gitconfig")
    out = subprocess.run(['more', gitconfig], capture_output=True, universal_newlines=True).stdout
    name = re.search('name = (.+)', out).group(1)
    email = re.search('email = (.+)', out).group(1)
    print(f'name: {name}\nemail: {email}')


if __name__ == "__main__":
    cli()
