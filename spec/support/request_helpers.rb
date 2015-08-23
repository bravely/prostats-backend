module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end

    def json_included_ids(resource)
      json['included'].map do |e|
        e['id'].to_i if e['type'] == resource
      end.compact
    end
  end
end
