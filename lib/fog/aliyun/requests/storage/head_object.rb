# frozen_string_literal: true

module Fog
  module Storage
    class Aliyun
      class Real
        # Get headers for object
        #
        # ==== Parameters
        # * object<~String> - Name of object to look for
        #
        def head_object(object, options = {})
          bucket = options[:bucket]
          bucket ||= @aliyun_oss_bucket
          endpoint = options[:endpoint]
          if endpoint.nil?
            endpoint = get_bucket_endpoint(bucket)
          end
          resource = bucket + '/' + object
          ret = request(
            expects: [200, 404],
            method: 'HEAD',
            path: object,
            bucket: bucket,
            resource: resource,
            endpoint: endpoint
          )
          ret
        end
      end
    end
  end
end
