# Class for scanning directories
class Directory
  def initialize(path = "/home/#{`whoami`}/")
    @cwd = path.delete("\n")
    @dir = Dir.new(@cwd)
    @tabs = '  '
  end

  def tree(path = @cwd, level = [], child_dir: false)
    return nil if Dir.empty?(path)

    Dir.each_child(path) do |child|
      path_to_child = "#{path}/#{child}"
      puts "#{level.join if child_dir}- #{Dir.exist?(path_to_child) ? '(dir) ' : '(file)'} #{child}"
      next unless Dir.exist?(path_to_child)

      children = tree(path_to_child, level.push(@tabs), child_dir: true)
      puts "#{level.join} #{children}" if children
      level.pop
      child_dir = false
    end
  end

  def ls(path = '.')
    Dir.each_child(path) do |child|
      path_to_child = "#{path}/#{child}"
      puts "- #{Dir.exist?(path_to_child) ? '(dir) ' : '(file)'} #{child}"
    end
  end
end
