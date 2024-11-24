# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  RANSACKABLE_ATTRIBUTES = YAML.load_file(Rails.root.join("config", "ransackable_attributes.yml"))

  primary_abstract_class

  class << self
    def ransackable_attributes(_auth_object = nil)
      RANSACKABLE_ATTRIBUTES[name.underscore]["attributes"]
    end

    def ransackable_associations(_auth_object = nil)
      RANSACKABLE_ATTRIBUTES[name.underscore]["associations"]
    end
  end
end
