module PrettyChat
  class Parser
    attr_accessor :input, :names, :padding, :output

    def initialize(*names)
      abort "You must provide a list of names of the chat participants." if names.empty?
      self.input = `pbpaste`
      self.names = names
      self.output = []
    end

    def parse
      names.each do |name|
        input.gsub!(/^#{name}\n/, "#{name}: ")
        input.gsub!(/^\d{1,2}:\d{2}\n/, "")
      end

      current_name = ""

      input.each_line do |line|
        matches = line.match(/^([\w\s]+): /)
        if matches
          current_name = matches[1]
        else
          line = "#{current_name}: #{line}"
        end
        output << line
      end

      output.join
    end
  end
end
