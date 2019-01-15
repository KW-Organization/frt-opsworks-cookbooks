execute 'ensure unicorn restart' do
  # Do a second unicorn restart - sometimes the current deploy results in a server returning 404 for everything
  command 'su deploy -c "/srv/www/kidzworld/shared/scripts/unicorn restart"'
end
