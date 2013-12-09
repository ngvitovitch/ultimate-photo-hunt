class Team < ActiveRecord::Base
	def change
		create_table :team do |t|
			t.name :string

			t.timestamps
		end
	end
end
