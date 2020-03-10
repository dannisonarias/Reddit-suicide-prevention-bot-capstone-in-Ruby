class TextFile
  def initialize(hash)
    @hash = hash
  end

  def write_to_textfile
    File.open("./test_list.txt", "a") do |line|
        line.puts "\r" + "<----------Start of Search----------> " + "Date: " + Time.now.to_s
        @hash.each do |p|
            line.puts "\r" + p.to_s
        end
        line.puts "\r" + "<----------End of Search---------->"
    end
  end
end
        
