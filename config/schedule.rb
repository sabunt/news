set :environment, "development"

# every 1.minute do
#   runner "HotNew.broadcast_lastpost"
# end
every 1.minute do
   runner "ReturnNewJob.perform_later(@hotnew)"
end