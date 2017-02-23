PROJECT      = "cratrix"
EXECUTABLE   = "bin/#{PROJECT}"
SOURCE_MAIN  = "src/#{PROJECT}.cr"
SOURCE_FILES = Rake::FileList.new('src/**/*.cr')
INSTALL_FILE = "/usr/local/bin/#{PROJECT}"

file EXECUTABLE => SOURCE_FILES do
  sh "crystal build --release -o #{EXECUTABLE} #{SOURCE_MAIN}"
end

desc 'Clean the project'
task :clean do
  rm EXECUTABLE
end

desc 'Build the project'
task build: EXECUTABLE

desc 'Install the project to the filesystem'
task install: :build do
  cp EXECUTABLE, INSTALL_FILE
end

desc 'Uninstall the project from the filesystem'
task :uninstall do
  rm INSTALL_FILE if File.exists?(INSTALL_FILE)
end

task default: :build
