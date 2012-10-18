# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:

set :output, "log/cron_log.log"

      # .---------------- minute (0 - 59)
      # |   .------------- hour (0 - 23)
      # |   |   .---------- day of month (1 - 31)
      # |   |   |   .------- month (1 - 12) OR jan,feb,mar,apr ...
      # |   |   |   |  .----- day of week (0 - 7) (Sunday=0 or 7)  OR sun,mon,tue,wed,thu,fri,sat
      # |   |   |   |  |
      # *   *   *   *  *  command to be executed

# Lunes, Martes y Viernes, cada 2 horas.
every '30 5-23/2 * * mon,tue,fri' do
  command "/usr/bin/rsync --archive /datos/compartir/smbtramite/01-PROYECTOS/ /datos/local_pdf/"
  rake "db:seed"
end

# Miercoles (cada hora).
every '30 6-23 * * wed' do
  command "/usr/bin/rsync --archive /datos/compartir/smbtramite/01-PROYECTOS/ /datos/local_pdf/"
  rake "db:seed"
end

# los jueves cada media hora entre las 6:20 y las 23:50
every '20-59/30 6-23 * * thu' do
  command "/usr/bin/rsync --archive /datos/compartir/smbtramite/01-PROYECTOS/ /datos/local_pdf/"
  rake "db:seed"
end

# Learn more: http://github.com/javan/whenever

