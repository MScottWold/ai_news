module StringEnum
  extend ActiveSupport::Concern

  class_methods do
    def string_enum(name, values)
      enum name, values.index_with(&:to_s)
    end
  end
end
