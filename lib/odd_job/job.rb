module OddJob
	module Job
  	# Move this to a before hook when we move to ActiveJob
  	def parse_options(version, options)
  		logger.info("version: #{version}, arguments: #{@options}")
  		@options = options.deep_symbolize_keys
  		yield
  	end

		def self.included(base)
			job_definition = OddJob.contract(base.name)	
  		base.sidekiq_options queue: job_definition[:queue]
  		base.extend(ClassMethods)
  		define_methods(job_definition[:parameters])
    end

    def self.define_methods(parameters)
    	parameters.each do |key, value|
    		key = key.to_sym
    		define_method(key) do
    			@options[key]
		  	end
    	end
    end

    module ClassMethods
    end
	end
end