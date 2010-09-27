require 'new_relic/agent/stats_engine/metric_stats'
require 'new_relic/agent/stats_engine/samplers'
require 'new_relic/agent/stats_engine/transactions'

module NewRelic
  module Agent
    class StatsEngine
      include MetricStats
      include Samplers
      include Transactions

      def initialize
        # Makes the unit tests happy
        Thread::current[:newrelic_scope_stack] = nil
        start_sampler_thread
        create_metric_stats_mutex
      end

      def log
        NewRelic::Control.instance.log
      end

    end
  end
end
