#!/usr/bin/env python

# This is an automatically generated script to run your query
# to use it you will require the intermine python client.
# To install the client, run the following command from a terminal:
#
#     sudo easy_install intermine
#
# For further documentation you can visit:
#     http://intermine.readthedocs.org/en/latest/web-services/

# The line below will be needed if you are running this script with python 2.
# Python 3 will ignore it.
from __future__ import print_function

# The following two lines will be needed in every python script:
from intermine.webservice import Service
service = Service("https://maizemine.rnet.missouri.edu/maizemine/service")

# Given a Zea mays gene id or symbol, retrieve GO terms.

template = service.get_template('Gene_GOterms')

# You can edit the constraint values below
# C    Gene

rows = template.rows(
    C = {"op": "LOOKUP", "value": "mytargetgene", "extra_value": ""}
)
for row in rows:
    print(row["organism.shortName"], row["primaryIdentifier"], row["symbol"], \
        row["goAnnotation.ontologyTerm.identifier"], row["goAnnotation.ontologyTerm.name"], \
        row["goAnnotation.ontologyTerm.description"], row["goAnnotation.ontologyTerm.namespace"])
