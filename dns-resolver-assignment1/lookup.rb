=begin
def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end
=end

# `domain` contains the domain name we have to look up.
#domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines

dns_raw = File.readlines("zone")
dns_raw.reject {|line| line.empty? }.map {|line| line.strip.split(", ") }.
reject do|record|
  puts record.length == 0?


=begin
def parse_dns(dns_raw)
  dns_records = {}
  raw.
    reject {|line| line.empty? }.
    map {|line| line.strip.split(", ") }.
    reject do|record|
      # 'Reject' records that aren't valid.
    end.
    .each_with_object([]) do |record, records|
      # Modify the `records` hash so that it contains necessary details.
    end

  dns_raw.each { |line|
    if line.strip[0] != "#" and line.strip.length != 0
      dns = {}
      dns[:type] = line.split(", ", -1)[0]
      dns[:destination] = line.split[2]
      source = line.split(", ", -1)[1]
      dns_records[source] = dns
    end
  }

  return dns_records
end

def resolve(dns_records, lookup_chain, domain)
  final_record = dns_records[domain]
  if not final_record
    lookup_chain = ["Error: Record not found for " + domain]
  elsif final_record[:type] == "A"
    lookup_chain.push(final_record[:destination])
  elsif final_record[:type] == "CNAME"
    lookup_chain.push(final_record[:destination])
    resolve(dns_records, lookup_chain, final_record[:destination])
  end
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
#=end
