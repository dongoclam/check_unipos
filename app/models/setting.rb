class Setting < ApplicationRecord
  validates :key, presence: true, uniqueness: true
  validates :value, presence: true

  Setting.singleton_class.class_eval do
    Setting.all.each do |setting|
      define_method "#{setting.key}" do
        setting.value
      end
    end
  end
end
