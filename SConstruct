import os

def missing_boost(headers):
    header_str = "\n  ".join(headers)
    error_message = """You are missing these boost headers:
  %s
Try setting the path to boost with --boost-path. Ex. scons --boost-path=/opt/local/include""" % header_str
    print error_message 
    Exit(1)

AddOption('--boost-path',
          dest='boost_path',
          type='string',
          nargs=1,
          metavar='BOOST_PATH',
          help='path to the include directory containing boost'
          )
AddOption('--prefix',
          dest='prefix',
          type='string',
          nargs=1,
          metavar='PREFIX',
          help='path to install directory for kdtree2'
          )

VariantDir('build', 'src-c++')

env = Environment()

if env.GetOption('boost_path'):
    env.AppendUnique(CPPPATH = env.GetOption('boost_path'))

env.Append(CXXFLAGS='-Wall -fast')
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

kdtree2 = env.SharedLibrary('build/kdtree2', 'build/kdtree2.cpp')

if env.GetOption('prefix'):
    prefix_path = env.GetOption('prefix') + '/lib' 
    env.Install(prefix_path, kdtree2)
else:
    env.Install('/usr/local/lib', kdtree2)

env.Alias('install', '/usr/local/lib')

kdtest = env.Program('build/kdtree2_test', 'build/kdtree2_test.cpp', LIBS=kdtree2)
    
