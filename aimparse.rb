#!/usr/bin/env ruby -w

class AimParse
  attr_accessor :input, :names, :padding, :output

  def initialize(*names)
    self.input = `pbpaste`
    self.names = names
    self.output = []
    determine_padding
  end

  def parse
    names.each do |name|
      input.gsub!("#{name}\n", "#{name}: ")
      input.gsub!(/^\d{1,2}:\d{2}\n/, "")
    end
    pad_output
  end

  def to_s
    output.join
  end

  private

  def determine_padding
    self.padding = " " * (self.names.max.length + 2)
  end

  def pad_output
    input.each_line do |line|
      line = padding + line unless line.start_with?(*names)
      output.push(line)
    end
  end
end
