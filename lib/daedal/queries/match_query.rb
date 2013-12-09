require 'daedal/queries/base_query'
require 'daedal/attributes'

module Daedal
  module Queries

    """Class for the match query"""
    class MatchQuery < BaseQuery
  
      # required attributes
      attribute :field, Symbol
      attribute :query, Symbol
  
      # non required attributes
      attribute :operator, Attributes::Operator, required: false
      attribute :minimum_should_match, Integer, required: false
      attribute :cutoff_frequency, Float, required: false
      attribute :type, Attributes::MatchType, required: false
      attribute :analyzer, Symbol, required: false
      attribute :boost, Integer, required: false
      attribute :fuzziness, Float, required: false
      attribute :slop, Integer, required: false
  
      def to_hash
  
        result = {match: {field => {query: query}}}
        options = {minimum_should_match: minimum_should_match, cutoff_frequency: cutoff_frequency, type: type, analyzer: analyzer, boost: boost, fuzziness: fuzziness, operator: operator, slop: slop}
        result[:match][field].merge! options.select {|k,v| !v.nil?}
  
        result
      end
    end
  end
end