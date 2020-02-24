class ChangeNameReviewEvaluationTypo < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :review_evalution, :review_evaluation
  end
end
