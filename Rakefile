# Constants

PROJECT     = "cratrix"
BUILD_DIR   = "build"
SOURCE_MAIN = "src/main.cr"

# Calculated constants

BUILD_PATH   = "#{BUILD_DIR}/#{RUBY_PLATFORM}"
EXECUTABLE   = "#{BUILD_PATH}/#{PROJECT}"
SOURCE_FILES = Rake::FileList.new('src/**/*.cr')
INSTALL_FILE = "/usr/local/bin/#{PROJECT}"

def print_env
  constants = %w[PROJECT BUILD_DIR SOURCE_MAIN BUILD_PATH EXECUTABLE SOURCE_FILES INSTALL_FILE]
  longest_constant = constants.map(&:length).max

  constants.each do |constant|
    puts "#{constant.ljust(longest_constant)} = #{Kernel.const_get(constant).inspect}"
  end
end

# Tasks

directory BUILD_PATH

file EXECUTABLE => [BUILD_PATH] + SOURCE_FILES do
  sh "crystal build --release -o #{EXECUTABLE} #{SOURCE_MAIN}"
end

desc "Clean the project"
task :clean do
  rm BUILD_DIR
end

desc "Build the project"
task build: EXECUTABLE

desc "Install the project to the filesystem"
task install: :build do
  cp EXECUTABLE, INSTALL_FILE
end

desc "Uninstall the project from the filesystem"
task :uninstall do
  rm INSTALL_FILE if File.exists?(INSTALL_FILE)
end

desc "Print the environment"
task :env do
  print_env
end

task default: :build
