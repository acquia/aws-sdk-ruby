# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

require 'aws-sdk-core/waiters'

module Aws::RDS
  # Waiters are utility methods that poll for a particular state to occur
  # on a client. Waiters can fail after a number of attempts at a polling
  # interval defined for the service client.
  #
  # For a list of operations that can be waited for and the
  # client methods called for each operation, see the table below or the
  # {Client#wait_until} field documentation for the {Client}.
  #
  # # Invoking a Waiter
  # To invoke a waiter, call #wait_until on a {Client}. The first parameter
  # is the waiter name, which is specific to the service client and indicates
  # which operation is being waited for. The second parameter is a hash of
  # parameters that are passed to the client method called by the waiter,
  # which varies according to the waiter name.
  #
  # # Wait Failures
  # To catch errors in a waiter, use WaiterFailed,
  # as shown in the following example.
  #
  #     rescue rescue Aws::Waiters::Errors::WaiterFailed => error
  #       puts "failed waiting for instance running: #{error.message}
  #     end
  #
  # # Configuring a Waiter
  # Each waiter has a default polling interval and a maximum number of
  # attempts it will make before returning control to your program.
  # To set these values, use the `max_attempts` and `delay` parameters
  # in your `#wait_until` call.
  # The following example waits for up to 25 seconds, polling every five seconds.
  #
  #     client.wait_until(...) do |w|
  #       w.max_attempts = 5
  #       w.delay = 5
  #     end
  #
  # To disable wait failures, set the value of either of these parameters
  # to `nil`.
  #
  # # Extending a Waiter
  # To modify the behavior of waiters, you can register callbacks that are
  # triggered before each polling attempt and before waiting.
  #
  # The following example implements an exponential backoff in a waiter
  # by doubling the amount of time to wait on every attempt.
  #
  #     client.wait_until(...) do |w|
  #       w.interval = 0 # disable normal sleep
  #       w.before_wait do |n, resp|
  #         sleep(n ** 2)
  #       end
  #     end
  #
  # # Available Waiters
  #
  # The following table lists the valid waiter names, the operations they call,
  # and the default `:delay` and `:max_attempts` values.
  #
  # | waiter_name                   | params                                 | :delay   | :max_attempts |
  # | ----------------------------- | -------------------------------------- | -------- | ------------- |
  # | db_cluster_available          | {Client#describe_db_clusters}          | 30       | 60            |
  # | db_cluster_deleted            | {Client#describe_db_clusters}          | 30       | 60            |
  # | db_cluster_snapshot_available | {Client#describe_db_cluster_snapshots} | 30       | 60            |
  # | db_cluster_snapshot_deleted   | {Client#describe_db_cluster_snapshots} | 30       | 60            |
  # | db_instance_available         | {Client#describe_db_instances}         | 30       | 60            |
  # | db_instance_deleted           | {Client#describe_db_instances}         | 30       | 60            |
  # | db_snapshot_available         | {Client#describe_db_snapshots}         | 30       | 60            |
  # | db_snapshot_deleted           | {Client#describe_db_snapshots}         | 30       | 60            |
  # | tenant_database_available     | {Client#describe_tenant_databases}     | 30       | 60            |
  # | tenant_database_deleted       | {Client#describe_tenant_databases}     | 30       | 60            |
  #
  module Waiters

    class DBClusterAvailable

      # @param [Hash] options
      # @option options [required, Client] :client
      # @option options [Integer] :max_attempts (60)
      # @option options [Integer] :delay (30)
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def initialize(options)
        @client = options.fetch(:client)
        @waiter = Aws::Waiters::Waiter.new({
          max_attempts: 60,
          delay: 30,
          poller: Aws::Waiters::Poller.new(
            operation_name: :describe_db_clusters,
            acceptors: [
              {
                "expected" => "available",
                "matcher" => "pathAll",
                "state" => "success",
                "argument" => "db_clusters[].status"
              },
              {
                "expected" => "deleted",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_clusters[].status"
              },
              {
                "expected" => "deleting",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_clusters[].status"
              },
              {
                "expected" => "failed",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_clusters[].status"
              },
              {
                "expected" => "incompatible-restore",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_clusters[].status"
              },
              {
                "expected" => "incompatible-parameters",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_clusters[].status"
              }
            ]
          )
        }.merge(options))
      end

      # @option (see Client#describe_db_clusters)
      # @return (see Client#describe_db_clusters)
      def wait(params = {})
        @waiter.wait(client: @client, params: params)
      end

      # @api private
      attr_reader :waiter

    end

    class DBClusterDeleted

      # @param [Hash] options
      # @option options [required, Client] :client
      # @option options [Integer] :max_attempts (60)
      # @option options [Integer] :delay (30)
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def initialize(options)
        @client = options.fetch(:client)
        @waiter = Aws::Waiters::Waiter.new({
          max_attempts: 60,
          delay: 30,
          poller: Aws::Waiters::Poller.new(
            operation_name: :describe_db_clusters,
            acceptors: [
              {
                "expected" => true,
                "matcher" => "path",
                "state" => "success",
                "argument" => "length(db_clusters) == `0`"
              },
              {
                "expected" => "DBClusterNotFoundFault",
                "matcher" => "error",
                "state" => "success"
              },
              {
                "expected" => "creating",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_clusters[].status"
              },
              {
                "expected" => "modifying",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_clusters[].status"
              },
              {
                "expected" => "rebooting",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_clusters[].status"
              },
              {
                "expected" => "resetting-master-credentials",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_clusters[].status"
              }
            ]
          )
        }.merge(options))
      end

      # @option (see Client#describe_db_clusters)
      # @return (see Client#describe_db_clusters)
      def wait(params = {})
        @waiter.wait(client: @client, params: params)
      end

      # @api private
      attr_reader :waiter

    end

    class DBClusterSnapshotAvailable

      # @param [Hash] options
      # @option options [required, Client] :client
      # @option options [Integer] :max_attempts (60)
      # @option options [Integer] :delay (30)
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def initialize(options)
        @client = options.fetch(:client)
        @waiter = Aws::Waiters::Waiter.new({
          max_attempts: 60,
          delay: 30,
          poller: Aws::Waiters::Poller.new(
            operation_name: :describe_db_cluster_snapshots,
            acceptors: [
              {
                "expected" => "available",
                "matcher" => "pathAll",
                "state" => "success",
                "argument" => "db_cluster_snapshots[].status"
              },
              {
                "expected" => "deleted",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_cluster_snapshots[].status"
              },
              {
                "expected" => "deleting",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_cluster_snapshots[].status"
              },
              {
                "expected" => "failed",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_cluster_snapshots[].status"
              },
              {
                "expected" => "incompatible-restore",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_cluster_snapshots[].status"
              },
              {
                "expected" => "incompatible-parameters",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_cluster_snapshots[].status"
              }
            ]
          )
        }.merge(options))
      end

      # @option (see Client#describe_db_cluster_snapshots)
      # @return (see Client#describe_db_cluster_snapshots)
      def wait(params = {})
        @waiter.wait(client: @client, params: params)
      end

      # @api private
      attr_reader :waiter

    end

    class DBClusterSnapshotDeleted

      # @param [Hash] options
      # @option options [required, Client] :client
      # @option options [Integer] :max_attempts (60)
      # @option options [Integer] :delay (30)
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def initialize(options)
        @client = options.fetch(:client)
        @waiter = Aws::Waiters::Waiter.new({
          max_attempts: 60,
          delay: 30,
          poller: Aws::Waiters::Poller.new(
            operation_name: :describe_db_cluster_snapshots,
            acceptors: [
              {
                "expected" => true,
                "matcher" => "path",
                "state" => "success",
                "argument" => "length(db_cluster_snapshots) == `0`"
              },
              {
                "expected" => "DBClusterSnapshotNotFoundFault",
                "matcher" => "error",
                "state" => "success"
              },
              {
                "expected" => "creating",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_cluster_snapshots[].status"
              },
              {
                "expected" => "modifying",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_cluster_snapshots[].status"
              },
              {
                "expected" => "rebooting",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_cluster_snapshots[].status"
              },
              {
                "expected" => "resetting-master-credentials",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_cluster_snapshots[].status"
              }
            ]
          )
        }.merge(options))
      end

      # @option (see Client#describe_db_cluster_snapshots)
      # @return (see Client#describe_db_cluster_snapshots)
      def wait(params = {})
        @waiter.wait(client: @client, params: params)
      end

      # @api private
      attr_reader :waiter

    end

    class DBInstanceAvailable

      # @param [Hash] options
      # @option options [required, Client] :client
      # @option options [Integer] :max_attempts (60)
      # @option options [Integer] :delay (30)
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def initialize(options)
        @client = options.fetch(:client)
        @waiter = Aws::Waiters::Waiter.new({
          max_attempts: 60,
          delay: 30,
          poller: Aws::Waiters::Poller.new(
            operation_name: :describe_db_instances,
            acceptors: [
              {
                "expected" => "available",
                "matcher" => "pathAll",
                "state" => "success",
                "argument" => "db_instances[].db_instance_status"
              },
              {
                "expected" => "deleted",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_instances[].db_instance_status"
              },
              {
                "expected" => "deleting",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_instances[].db_instance_status"
              },
              {
                "expected" => "failed",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_instances[].db_instance_status"
              },
              {
                "expected" => "incompatible-restore",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_instances[].db_instance_status"
              },
              {
                "expected" => "incompatible-parameters",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_instances[].db_instance_status"
              }
            ]
          )
        }.merge(options))
      end

      # @option (see Client#describe_db_instances)
      # @return (see Client#describe_db_instances)
      def wait(params = {})
        @waiter.wait(client: @client, params: params)
      end

      # @api private
      attr_reader :waiter

    end

    class DBInstanceDeleted

      # @param [Hash] options
      # @option options [required, Client] :client
      # @option options [Integer] :max_attempts (60)
      # @option options [Integer] :delay (30)
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def initialize(options)
        @client = options.fetch(:client)
        @waiter = Aws::Waiters::Waiter.new({
          max_attempts: 60,
          delay: 30,
          poller: Aws::Waiters::Poller.new(
            operation_name: :describe_db_instances,
            acceptors: [
              {
                "expected" => true,
                "matcher" => "path",
                "state" => "success",
                "argument" => "length(db_instances) == `0`"
              },
              {
                "expected" => "DBInstanceNotFound",
                "matcher" => "error",
                "state" => "success"
              },
              {
                "expected" => "creating",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_instances[].db_instance_status"
              },
              {
                "expected" => "modifying",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_instances[].db_instance_status"
              },
              {
                "expected" => "rebooting",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_instances[].db_instance_status"
              },
              {
                "expected" => "resetting-master-credentials",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_instances[].db_instance_status"
              }
            ]
          )
        }.merge(options))
      end

      # @option (see Client#describe_db_instances)
      # @return (see Client#describe_db_instances)
      def wait(params = {})
        @waiter.wait(client: @client, params: params)
      end

      # @api private
      attr_reader :waiter

    end

    class DBSnapshotAvailable

      # @param [Hash] options
      # @option options [required, Client] :client
      # @option options [Integer] :max_attempts (60)
      # @option options [Integer] :delay (30)
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def initialize(options)
        @client = options.fetch(:client)
        @waiter = Aws::Waiters::Waiter.new({
          max_attempts: 60,
          delay: 30,
          poller: Aws::Waiters::Poller.new(
            operation_name: :describe_db_snapshots,
            acceptors: [
              {
                "expected" => "available",
                "matcher" => "pathAll",
                "state" => "success",
                "argument" => "db_snapshots[].status"
              },
              {
                "expected" => "deleted",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_snapshots[].status"
              },
              {
                "expected" => "deleting",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_snapshots[].status"
              },
              {
                "expected" => "failed",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_snapshots[].status"
              },
              {
                "expected" => "incompatible-restore",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_snapshots[].status"
              },
              {
                "expected" => "incompatible-parameters",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_snapshots[].status"
              }
            ]
          )
        }.merge(options))
      end

      # @option (see Client#describe_db_snapshots)
      # @return (see Client#describe_db_snapshots)
      def wait(params = {})
        @waiter.wait(client: @client, params: params)
      end

      # @api private
      attr_reader :waiter

    end

    class DBSnapshotDeleted

      # @param [Hash] options
      # @option options [required, Client] :client
      # @option options [Integer] :max_attempts (60)
      # @option options [Integer] :delay (30)
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def initialize(options)
        @client = options.fetch(:client)
        @waiter = Aws::Waiters::Waiter.new({
          max_attempts: 60,
          delay: 30,
          poller: Aws::Waiters::Poller.new(
            operation_name: :describe_db_snapshots,
            acceptors: [
              {
                "expected" => true,
                "matcher" => "path",
                "state" => "success",
                "argument" => "length(db_snapshots) == `0`"
              },
              {
                "expected" => "DBSnapshotNotFound",
                "matcher" => "error",
                "state" => "success"
              },
              {
                "expected" => "creating",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_snapshots[].status"
              },
              {
                "expected" => "modifying",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_snapshots[].status"
              },
              {
                "expected" => "rebooting",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_snapshots[].status"
              },
              {
                "expected" => "resetting-master-credentials",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "db_snapshots[].status"
              }
            ]
          )
        }.merge(options))
      end

      # @option (see Client#describe_db_snapshots)
      # @return (see Client#describe_db_snapshots)
      def wait(params = {})
        @waiter.wait(client: @client, params: params)
      end

      # @api private
      attr_reader :waiter

    end

    class TenantDatabaseAvailable

      # @param [Hash] options
      # @option options [required, Client] :client
      # @option options [Integer] :max_attempts (60)
      # @option options [Integer] :delay (30)
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def initialize(options)
        @client = options.fetch(:client)
        @waiter = Aws::Waiters::Waiter.new({
          max_attempts: 60,
          delay: 30,
          poller: Aws::Waiters::Poller.new(
            operation_name: :describe_tenant_databases,
            acceptors: [
              {
                "expected" => "available",
                "matcher" => "pathAll",
                "state" => "success",
                "argument" => "tenant_databases[].status"
              },
              {
                "expected" => "deleted",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "tenant_databases[].status"
              },
              {
                "expected" => "incompatible-parameters",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "tenant_databases[].status"
              },
              {
                "expected" => "incompatible-restore",
                "matcher" => "pathAny",
                "state" => "failure",
                "argument" => "tenant_databases[].status"
              }
            ]
          )
        }.merge(options))
      end

      # @option (see Client#describe_tenant_databases)
      # @return (see Client#describe_tenant_databases)
      def wait(params = {})
        @waiter.wait(client: @client, params: params)
      end

      # @api private
      attr_reader :waiter

    end

    class TenantDatabaseDeleted

      # @param [Hash] options
      # @option options [required, Client] :client
      # @option options [Integer] :max_attempts (60)
      # @option options [Integer] :delay (30)
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def initialize(options)
        @client = options.fetch(:client)
        @waiter = Aws::Waiters::Waiter.new({
          max_attempts: 60,
          delay: 30,
          poller: Aws::Waiters::Poller.new(
            operation_name: :describe_tenant_databases,
            acceptors: [
              {
                "expected" => true,
                "matcher" => "path",
                "state" => "success",
                "argument" => "length(tenant_databases) == `0`"
              },
              {
                "expected" => "DBInstanceNotFoundFault",
                "matcher" => "error",
                "state" => "success"
              }
            ]
          )
        }.merge(options))
      end

      # @option (see Client#describe_tenant_databases)
      # @return (see Client#describe_tenant_databases)
      def wait(params = {})
        @waiter.wait(client: @client, params: params)
      end

      # @api private
      attr_reader :waiter

    end
  end
end
