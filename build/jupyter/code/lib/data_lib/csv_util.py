import csv
import pandas as pd

def apply(in_path, out_path, row_transform, add_cols=[], delimiter=",", quotechar='"'):
    with open(out_path, "w+", newline="") as out_f: 
        with open(in_path, newline="") as in_f:
            reader = csv.DictReader(in_f, delimiter=delimiter, quotechar=quotechar)
            writer = csv.DictWriter(out_f, delimiter=delimiter, quotechar=quotechar, fieldnames=[*reader.fieldnames, *add_cols])
            writer.writeheader()
            for row in reader:
                writer.writerow(row_transform(row))

def csv2df(csv_path):
    return pd.read_csv(csv_path)

def strip_cols(in_path, out_path, cols=[], delimiter=",", quotechar='"'):
    with open(out_path, "w+", newline="") as out_f: 
        with open(in_path, newline="") as in_f:
            reader = csv.DictReader(in_f, delimiter=delimiter, quotechar=quotechar)
            fieldnames = [key for key in reader.fieldnames if key not in cols]
            writer = csv.DictWriter(out_f, delimiter=delimiter, quotechar=quotechar, fieldnames=fieldnames)
            writer.writeheader()
            for row in reader:
                writer.writerow({key: value for key, value in row.items() if key not in cols})
