class LDAPSearch
  class << self

    def find_param(user_param, search_param, result_param)
      result_attrs = [ search_param, result_param ]
      search_filter = Net::LDAP::Filter.eq( search_param, user_param )
      result = []
      Net::LDAP.open(:host => host_name, :port => port_number, :encryption => :start_tls, :base => "o=Novell") do |ldap|
        ldap.search(:filter => search_filter, :attributes => result_attrs ) do | entry |
          result << entry.send(result_param).first
        end
      end
      result
    end
  end
end
