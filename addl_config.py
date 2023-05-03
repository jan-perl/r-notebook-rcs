c.NotebookApp.contents_manager_class = "jupytext.TextFileContentsManager"
c.ContentsManager.default_jupytext_formats = "ipynb,R"

import os
from subprocess import check_call

def post_save(model, os_path, contents_manager):
    """post-save hook for storing versions of scripts"""
    if model["type"] != "notebook":
        return # only do this for notebooks
    d, fname = os.path.split(os_path)
    if fname.endswith('.ipynb'):
        return # dont do this for notebooks source
# old RCS style check_call(["ci","-d","-l","-t-title","-m-msg", fname], cwd=d)
#    check_call(["/home/jovyan/.jupyter/commit-ch.sh", fname], cwd=d)
#    check_call(["git","add", fname], cwd=d)
#    check_call(["git","commit","-m-msg", fname], cwd=d)
#    check_call(["git","push"], cwd=d)

c.FileContentsManager.post_save_hook = post_save

c.ContentsManager.hide_globs = ['__pycache__', '*.pyc', '*.pyo', '.DS_Store', '*.so', '*.dylib', '*~', '*,v']

