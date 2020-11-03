#!/usr/bin/env python

import setuptools

setuptools.setup(name='data_lib',
      version='1.0',
      description='Data Science and Database Library',
      author='Noah Hummel',
      author_email='info@hummelit.de',
      url='https://hummelit,de',
      packages=setuptools.find_packages(),
      install_requires=[
          'mysql-connector-python',
      ]
    )