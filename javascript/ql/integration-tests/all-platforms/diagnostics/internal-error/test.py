import os
from create_database_utils import *
from diagnostics_test_utils import *

run_codeql_database_create([], lang="javascript", runFunction = runUnsuccessfully, db = None)

check_diagnostics()
