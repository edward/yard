module YARD
  module Generators
    class MethodSignatureGenerator < Base
      def sections_for(object) 
        [:main] if object.signature
      end
      
      protected
      
      def format_def(object)
        object.signature.gsub(/^def\s*/, '')
      end
      
      def format_return_types(object)
        typenames = "Object"
        if object.has_tag?(:return)
          types = object.tags(:return).map do |t| 
            t.types.map do |type| 
              type.gsub(/(^|[<>])\s*([^<>#]+)\s*(?=[<>]|$)/) {|m| $1 + linkify($2) }
            end
          end.flatten
          typenames = types.size == 1 ? types.first : "[#{types.join(", ")}]"
        end
        typenames
      end
    end
  end
end