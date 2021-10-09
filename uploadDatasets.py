import csv
from re import sub
from ckanapi import LocalCKAN, RemoteCKAN
ua = 'ckanapiexample/1.0 (+http://example.com/my/website)'

def kebab(s):
  return '-'.join(
    sub(r"(\s|_|-)+"," ",
    sub(r"[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+",
    lambda mo: ' ' + mo.group(0).lower(), s)).split())

with open('datasets.csv') as csv_file:
    csv_reader=csv.reader(csv_file,delimiter=',')
    line_count=0

    with RemoteCKAN('http://localhost:8080', apikey='b04ccbac-e13a-4496-b665-c04b43ecc07c') as demo:
        for row in csv_reader:
            if line_count > 0:
                try:
                    orgId = kebab(row[0])
                    nameId = kebab(row[1])
                    #print(nameId)
                    pkg = demo.action.package_create(name=nameId, title=row[1], notes=row[2], owner_org=orgId)
                    #print(pkg)
                    demo.action.resource_create(package_id=nameId, url=row[3], name=row[1],description=row[2])
                except Exception as e:
                    print(e)
                    print(row[1])
            line_count = line_count + 1

print('Finito')
