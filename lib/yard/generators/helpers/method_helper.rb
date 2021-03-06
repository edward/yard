module YARD
  module Generators::Helpers
    module MethodHelper
      def format_args(object)
        if object.signature
          h object.signature[/#{Regexp.quote object.name.to_s}\s*(.*)/, 1]
        else
          h "def #{object.name}"
        end
      end
      
      def format_return_types(object)
        if object.has_tag?(:return) && !object.tag(:return).types.empty?
          format_types [object.tag(:return).types.first], false
        end
      end
      
      def format_block(object)
        if object.has_tag?(:yieldparam)
          h "{|" + object.tags(:yieldparam).map {|t| t.name }.join(", ") + "| ... }"
        else
          ""
        end
      end
    end
  end
end