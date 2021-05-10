class PersonalTrainer < ApplicationRecord
	has_many :gym_classes
	has_many :pt_clients
end
