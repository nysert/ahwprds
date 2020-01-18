require 'nokogiri'
require 'date'

if ARGV.length >= 1
  path = ARGV[0]
  starts_arg = (ARGV[1] ? DateTime.parse(ARGV[1]) : DateTime.now - 30)
  ends_arg = (ARGV[2] ? DateTime.parse(ARGV[2]) : DateTime.now)

  sum = 0

  File.open(path).each_line{|line|
    if line.include?('<Record type="HKQuantityTypeIdentifierDistanceWalkingRunning"')
      xml = Nokogiri.XML(line)
      element = xml.xpath("//Record")

      starts_date = DateTime.parse(element.attribute("startDate"))
      ends_date = DateTime.parse(element.attribute("endDate"))

      if starts_date >= starts_arg && ends_date <= ends_arg
        value = element.attribute("value").value.to_f
        sum = sum + value
      end
    end
  }

  puts sum
else
  puts "File path is required"
end
