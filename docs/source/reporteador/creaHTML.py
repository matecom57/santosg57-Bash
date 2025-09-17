d1 = '''<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>
'''

#<h1>This is a Heading</h1>
#<p>This is a paragraph.</p>

d2 = '''</body>
</html>
'''

filein = 'moca.txt'
fileon = 'reportreador.html'

filin = open(filein,'r')
filon = open(fileon,'w')

filon.write(d1)

datos = filin.readlines()

for ss in datos:
  ss = ss.replace('\n','')
  if 'moca' in ss:
    ss1 = '<p>' + ss + '</p>\n'
    filon.write(ss1)
    print(ss)

filon.write(d2)
filon.close()


