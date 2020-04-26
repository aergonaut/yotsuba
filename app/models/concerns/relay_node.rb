module RelayNode
  extend ActiveSupport::Concern

  class_methods do
    def graphql_type
      "Types::#{model_name.name}Type".safe_constantize
    end
  end
end
