module Blockparty
  class API < Grape::API
    prefix 'api'
    version 'v1'
    format :json

    resource :block_list_servers do
      get do
        BlockListServer.all
      end
    end

    resource :mail_servers do
      get do
        MailServer.all
      end

      get 'blacklisted' do
        response = MailServer.all.collect do |mail_server|
          if !mail_server.block_list_servers.empty?
            {
              :name => mail_server.name,
              :ip => mail_server.ip,
              :block_list_servers => mail_server.block_list_servers
            }
          end
        end

        [] if response == nil
      end
    end
  end
end 