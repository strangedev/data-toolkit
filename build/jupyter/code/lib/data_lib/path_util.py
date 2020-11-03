import os

def rel(base):
    def __fn(pathlike):
        return os.path.join(base, pathlike)
    return __fn