class Condition < ActiveRecord::Base
  belongs_to :patient

  def self.list
    @@condition_list
  end

  @@condition_list = {
    "acne",
    "actinic keratosis",
    "atypical mole",
    "basal cell carcinoma",
    "contact dermatitis",
    "cyst",
    "dermatitis",
    "eczema",
    "lipoma",
    "melanoma",
    "squamous cell carcinoma",
    "wart(s)"
  }
end
