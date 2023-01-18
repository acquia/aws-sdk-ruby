# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws::FSx
  class EndpointProvider
    def resolve_endpoint(parameters)
      region = parameters.region
      use_dual_stack = parameters.use_dual_stack
      use_fips = parameters.use_fips
      endpoint = parameters.endpoint
      if (partition_result = Aws::Endpoints::Matchers.aws_partition(region))
        if Aws::Endpoints::Matchers.set?(endpoint)
          if Aws::Endpoints::Matchers.boolean_equals?(use_fips, true)
            raise ArgumentError, "Invalid Configuration: FIPS and custom endpoint are not supported"
          end
          if Aws::Endpoints::Matchers.boolean_equals?(use_dual_stack, true)
            raise ArgumentError, "Invalid Configuration: Dualstack and custom endpoint are not supported"
          end
          return Aws::Endpoints::Endpoint.new(url: endpoint, headers: {}, properties: {})
        end
        if Aws::Endpoints::Matchers.boolean_equals?(use_fips, true) && Aws::Endpoints::Matchers.boolean_equals?(use_dual_stack, true)
          if Aws::Endpoints::Matchers.boolean_equals?(true, Aws::Endpoints::Matchers.attr(partition_result, "supportsFIPS")) && Aws::Endpoints::Matchers.boolean_equals?(true, Aws::Endpoints::Matchers.attr(partition_result, "supportsDualStack"))
            return Aws::Endpoints::Endpoint.new(url: "https://fsx-fips.#{region}.#{partition_result['dualStackDnsSuffix']}", headers: {}, properties: {})
          end
          raise ArgumentError, "FIPS and DualStack are enabled, but this partition does not support one or both"
        end
        if Aws::Endpoints::Matchers.boolean_equals?(use_fips, true)
          if Aws::Endpoints::Matchers.boolean_equals?(true, Aws::Endpoints::Matchers.attr(partition_result, "supportsFIPS"))
            if Aws::Endpoints::Matchers.string_equals?(region, "prod-ca-central-1")
              return Aws::Endpoints::Endpoint.new(url: "https://fsx-fips.ca-central-1.amazonaws.com", headers: {}, properties: {})
            end
            if Aws::Endpoints::Matchers.string_equals?(region, "prod-us-east-1")
              return Aws::Endpoints::Endpoint.new(url: "https://fsx-fips.us-east-1.amazonaws.com", headers: {}, properties: {})
            end
            if Aws::Endpoints::Matchers.string_equals?(region, "prod-us-east-2")
              return Aws::Endpoints::Endpoint.new(url: "https://fsx-fips.us-east-2.amazonaws.com", headers: {}, properties: {})
            end
            if Aws::Endpoints::Matchers.string_equals?(region, "prod-us-west-1")
              return Aws::Endpoints::Endpoint.new(url: "https://fsx-fips.us-west-1.amazonaws.com", headers: {}, properties: {})
            end
            if Aws::Endpoints::Matchers.string_equals?(region, "prod-us-west-2")
              return Aws::Endpoints::Endpoint.new(url: "https://fsx-fips.us-west-2.amazonaws.com", headers: {}, properties: {})
            end
            if Aws::Endpoints::Matchers.string_equals?(region, "prod-us-gov-east-1")
              return Aws::Endpoints::Endpoint.new(url: "https://fsx-fips.us-gov-east-1.amazonaws.com", headers: {}, properties: {})
            end
            if Aws::Endpoints::Matchers.string_equals?(region, "prod-us-gov-west-1")
              return Aws::Endpoints::Endpoint.new(url: "https://fsx-fips.us-gov-west-1.amazonaws.com", headers: {}, properties: {})
            end
            return Aws::Endpoints::Endpoint.new(url: "https://fsx-fips.#{region}.#{partition_result['dnsSuffix']}", headers: {}, properties: {})
          end
          raise ArgumentError, "FIPS is enabled but this partition does not support FIPS"
        end
        if Aws::Endpoints::Matchers.boolean_equals?(use_dual_stack, true)
          if Aws::Endpoints::Matchers.boolean_equals?(true, Aws::Endpoints::Matchers.attr(partition_result, "supportsDualStack"))
            return Aws::Endpoints::Endpoint.new(url: "https://fsx.#{region}.#{partition_result['dualStackDnsSuffix']}", headers: {}, properties: {})
          end
          raise ArgumentError, "DualStack is enabled but this partition does not support DualStack"
        end
        return Aws::Endpoints::Endpoint.new(url: "https://fsx.#{region}.#{partition_result['dnsSuffix']}", headers: {}, properties: {})
      end
      raise ArgumentError, 'No endpoint could be resolved'

    end
  end
end
