require 'daedal/queries/base_query'
require 'daedal/filters/base_filter'
require 'daedal/attributes'

module Daedal
  module Queries
    """Class for the constant score query"""
    class ConstantScoreQuery < BaseQuery

      # required attributes
      attribute :boost, Float

      # non required attributes, but one must be required of the two
      attribute :query, Daedal::Queries::BaseQuery, required: false
      attribute :filter, Daedal::Filters::BaseFilter, required: false

      # you must require *one of* query or filter in order for this to be valid
      def initialize(options={})
        super options
        if query.nil? && filter.nil?
          raise "Must give a query or a filter"
        end
      end
  
      def to_hash
        result = {constant_score: {boost: boost}}
        if !query.nil?
          result[:constant_score][:query] = query.to_hash
        elsif !filter.nil?
          result[:constant_score][:filter] = filter.to_hash
        end

        result
      end
    end
  end
end