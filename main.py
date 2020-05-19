import json

def define_env(env):
    """
    This is the hook for the functions (new form)
    """

    env.variables["hello"] = "hello"
    # use dot notation for adding
    env.variables["baz"] = "buz"

    with open('cv/resume.json') as json_file:
        env.variables["resume"] = json.load(json_file)
