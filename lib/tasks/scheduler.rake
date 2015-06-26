desc "This task resets all existing morsel data in the database (should be run once per day at midnight)."
task :reset_morsels => :environment do
	Morsel.delete_all

	general_morsel_list = MorselsHelper.get_morsel_list("general")
	general_morsel_list.each do |morsel_name|
		puts "Creating today's #{morsel_name} morsel..."
		if MorselsHelper.get_morsel(morsel_name, "")
			puts "Done."
		else
			puts "Failed."
		end
	end

	puts "Finished resetting all morsels."
end
