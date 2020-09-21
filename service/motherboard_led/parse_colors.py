from bs4 import BeautifulSoup
import json

html = open("colors.html").read()
soup = BeautifulSoup(html, features="lxml")
table = soup

output_rows = []
extracted_columns = [4,5,6]
for table_row in table.findAll('tr'):
    columns = table_row.findAll('td')
    output_row = []
    col = 0
    for column in columns:
        if col in extracted_columns:
            output_row.append(int(column.text))
        col +=1
    output_rows.append(output_row)

with open('colors.json', 'w') as data:
    json.dump(output_rows, data, ensure_ascii=False, indent=4)
