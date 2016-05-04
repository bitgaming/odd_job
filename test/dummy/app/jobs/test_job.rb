class TestJob < ActiveJob::Base
	include 
 
  def perform(*guests)
    # Do something later
  end
end