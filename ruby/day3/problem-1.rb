# Modify the CSV application to support an each method to return a
# CsvRow object. Use method_missing on that CsvRow to return the value
# for the column for a given heading.

class CsvRow
  attr_accessor :headers, :row
  def  initialize (headers,row)
    @headers = headers
    @row = row
  end

  def method_missing name, *args
    row[headers.index(name.to_s)]
  end
end

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end

  end
  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @csv_contents << CsvRow.new(headers,row.chomp.split(', '))
      end
    end
    def each &block
      @csv_contents.each &block 
    end
    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row.Name}
csv.each {|row| puts row.Github}
