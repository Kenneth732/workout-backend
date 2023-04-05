#  assets.rake
namespace :assets do
    desc "Precompile assets"
    task :precompile do
      system("rake assets:precompile")
    end
  
    desc "Clean assets"
    task :clean do
      system("rake assets:clean")
    end
  end
  
