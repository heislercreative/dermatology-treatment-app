class Condition < ActiveRecord::Base
  belongs_to :patient

  def self.list
    @@condition_list
  end

  @@condition_list = [
    "Acne",
    "Actinic keratosis",
    "Atypical mole",
    "Basal cell carcinoma",
    "Contact dermatitis",
    "Cyst",
    "Dermatitis",
    "Eczema",
    "Lipoma",
    "Melanoma",
    "Squamous cell carcinoma",
    "Wart(s)"
  ]
end
