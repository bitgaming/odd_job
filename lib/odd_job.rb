module OddJob
  # The realm used in Http Basic Authentication.
  mattr_accessor :contract_directory
  @@contract_directory = nil

  mattr_reader :contracts
  @@contracts = nil

  def self.setup
    yield self
  end

  def self.contract(job_name)
    contracts[job_name.to_sym]
  end

  def self.contracts
    @@contracts = @@contracts || load_contract_directory      
  end

  def self.load_contract_directory
    contracts = {}
    Dir.glob("#{@@contract_directory}/*.yml") do |file|
      class_name = /([A-Z|a-z|0-9|_]+).yml$/.match(file)
      config = YAML::load(File.open(file)).deep_symbolize_keys
      contracts[class_name[1].camelize.to_sym] = config
    end
    contracts
  end
end

require 'odd_job/job'