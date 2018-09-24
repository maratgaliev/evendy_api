class RatingCalculationWorker
  include Sidekiq::Worker

  def perform(*args)
    User.all.map { |x| x.update_column(:cached_rating, x.rating) }
    logger.info "ALL RATINGS WAS RECALCULATED"
  end
end
