def list_rails_models
  ActiveRecord::Base.connection.tables.map do |model|
    model.capitalize.singularize.camelize
  end

  # returns ["Activity", "Article", "User", "Video", "Vote"]
end
