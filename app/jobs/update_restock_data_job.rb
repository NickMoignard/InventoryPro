class UpdateRestockDataJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # performed before a report is generated
    #
    #
  end
end
