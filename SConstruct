import os

def missing_boost(headers):
    header_str = "\n  ".join(headers)
    error_message = """You are missing these boost headers:
  %s
Try setting the boost_path environment variable. Ex. boost_path=/opt/local/include scons""" % header_str
    print error_message 
    Exit(1)

env = Environment()




if os.environ.get('boost_path', False):
    env.AppendUnique(CPPPATH = os.environ['boost_path'])

# This is a common path for OS X
env.AppendUnique(CPPPATH = '/opt/local/include')

conf = Configure(env)

if not env.GetOption('clean'):
    missing_headers = []
    if not conf.CheckCXXHeader('boost/multi_array.hpp'):
        missing_headers.append('boost/multi_array.hpp')

        
    if not conf.CheckCXXHeader('boost/random.hpp'):
        missing_headers.append('boost/random.hpp')
    if missing_headers != []:
        missing_boost(missing_headers)

env = conf.Finish()

env.Library('kdtree2', 'src-c++/kdtree2.cpp')
