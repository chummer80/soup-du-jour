desc "This task resets all existing morsel data in the database (should be run once per day at midnight)."
task :reset_morsels => :environment do
	Morsel.delete_all

	%w(soup word reddit beer recipe news video musicvideo trivia).each do |morsel_name|
		puts "Creating today's #{morsel_name} morsel..."
		MorselsHelper.create_morsel(morsel_name)
		puts "Done."
	end

	puts "Finished resetting all morsels."
end
