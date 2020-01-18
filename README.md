# Apple Health Walking Plus Running Distance Script
Simple ruby script to see the sum of your apple health walking + running distance
on a specific datetime range.

To get the data from your iphone:
 1. Open Health App
 2. Go to your profile
 3. Click `Export Health Data`

## Usage
1. `git clone https://github.com/nysert/ahwprds`
2. `bundle install`
3. `ruby ahwprds.rb PATH [STARTS_DATE_TIME] [ENDS_DATE_TIME]`

| ARG              | Constraint            | Default               |
| -----------------|-----------------------|-----------------------|
| PATH             | REQUIRED              |                       |
| STARTS_DATE_TIME | OPTIONAL              | `(DateTime.now - 30)` |
| ENDS_DATE_TIME   | OPTIONAL              | `DateTime.now`        |

Apple adds timezone to their timestamps so try to pass the timezone to `STARTS_DATE_TIME` and `ENDS_DATE_TIME` args

## Examples:
```console
$ ruby ahwprds.rb ~/Downloads/apple_health_export/export.xml
123.456

$ ruby ahwprds.rb ~/Downloads/apple_health_export/export.xml '2010-10-08 14:35:00 -0600'
123.456

$ ruby ahwprds.rb ~/Downloads/apple_health_export/export.xml '2019-10-08 14:35:00 -0600' '2020-01-13 23:00:00 -0600'
123.456
```
