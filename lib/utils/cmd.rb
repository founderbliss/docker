module Cmd
  def help(arg)
    if arg.eql?('help') || arg.eql?('--help')
      puts 'Usage:'
      puts "bliss\t\t\t Run the CLI."
      puts "bliss init \t\t Send preliminary repository data to Bliss."
      puts "bliss help\t\t Display this help message."
      exit
    end
  end

  def version(arg)
    if arg.eql?('version') || arg.eql?('-v') || arg.eql?('--version')
      puts $VERSION
      exit
    end
  end
end
