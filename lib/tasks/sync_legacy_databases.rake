namespace :db do
  namespace :legacy do

    task :rsync_legacy_database do
      if Dir.exist? "/datos/compartir/smbtramite/01-PROYECTOS/"
        puts "starting sync"
        system "/usr/bin/rsync --verbose --archive /datos/compartir/smbtramite/01-PROYECTOS/ /datos/local_pdf/"
        puts "sucefully synced" if $?
        $?
      else
        puts "No se encuentra el directorio de sincronizacion"
      end
    end

    desc "Migrate the data from the legacy database onto the new database"
    task :migrate => [:rsync_legacy_database, :environment] do
      puts "Comenzando la migracion"
      require 'legacy'
      Legacy.seed_legacy_databases
      puts "Migracion finalizada"
    end

  end
end

