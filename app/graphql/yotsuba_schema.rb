# typed: strict
class YotsubaSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # Opt in to the new runtime (default in future graphql-ruby versions)
  use GraphQL::Execution::Interpreter
  use GraphQL::Analysis::AST

  # Add built-in connections for pagination
  use GraphQL::Pagination::Connections

  default_max_page_size 50

  def self.id_from_object(object, _type_definition, _query_context)
    object.to_sgid.to_s
  end

  def self.object_from_id(id, _query_context)
    GlobalID::Locator.locate_signed(id)
  end

  def self.resolve_type(type, obj, context)
    if obj.class.respond_to?(:graphql_type)
      obj.class.graphql_type
    else
      raise "Unexpected object: #{obj}"
    end
  end
end
