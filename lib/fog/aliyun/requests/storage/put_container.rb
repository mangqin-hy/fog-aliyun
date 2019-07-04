# frozen_string_literal: true

module Fog
  module Storage
    class Aliyun
      class Real
        # Create a new container
        #
        # ==== Parameters
        # * name<~String> - Name for container
        #
        def put_container(name, options = {})
          bucket = options[:bucket]
          bucket ||= @aliyun_oss_bucket
          endpoint = options[:endpoint]
          if endpoint.nil?
            endpoint = get_bucket_endpoint(bucket)
          end

          path = name + '/'
          resource = bucket + '/' + name + '/'
          request(
            expects: [200, 203],
            method: 'PUT',
            path: path,
            bucket: bucket,
            resource: resource,
            endpoint: endpoint
          )
        end
      end
    end
  end
end
