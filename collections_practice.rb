require "pry"

def begins_with_r(array)
	array.all? {|x| x.chars.first == "r"}
end

def contain_a(array)
	new_array = []
	array.select do |x|
		if x.include?("a")
			new_array.push(x)
		end
	end
	new_array
end

def first_wa(array)
	array.each do |x|
		if x.to_s.include?("wa")
			return x
		end
	end
end

def remove_non_strings(array)
	#array.each do |x|
		array.delete_if {|x| x.class == Integer || x.class == Symbol}
		#if x.class != String
			#array.pop
		#end
end

def count_elements(array)
	result = []
	grouped = array.group_by {|x| x[:name]}
	grouped.each do |name, amt_of_names|
		amt_of_names.each do |person|
			person[:count] = amt_of_names.length
			result << person
		end
	end
	result.uniq
end


=begin
def merge_data(keys, data)
	result_array = []
	final_array = []
	final_final_array = []
	return_array = []
	keys.each do |people|
		people.each do |name_motto, name_motto_string|
			result_array << {name_motto => name_motto_string}
		end
		data.each do |persons|
			persons.values.each do |attribute|
				final_array << (result_array << attribute)
				final_final_array = final_array.reduce(&:merge)
				return_array << final_final_array	
			end
			#result_array << persons.values.reduce(:merge)
			#final_array = result_array.reduce(:merge)
			#binding.pry
		end
	end
	return_array
end
=end

def merge_data(keys, data)
	data[0].map do |name, properties|
		temp_hash = {}
		keys.each do |properties_2|
			if properties_2[:first_name] == name
				temp_hash = properties.merge(properties_2)
			end
		end
		temp_hash
	end
end


def find_cool(a)
	a.each do |people_hash|
		if people_hash.values.include?("cool")
			return [people_hash]
		end	
	end
end

=begin
def organize_schools(schools_hash)
	school_array = []
	locations_array = []
	schools_hash.each do |school_name, location_hash|
		school_array << school_name
		locations_array << location_hash.values
	end
	schools_hash.map do |school_name, location_hash|
		temp_hash = {}
		locations_array.each do |city|
			if city == location_hash.values
				temp_hash[city] = school_name
			end
		end
		temp_hash
	end
end
=end

def organize_schools(schools_hash)
	final_hash = {}
	schools_hash.each do |name, location_hash|
		location_hash.each do |location, city|
			final_hash[city] ||= []
			final_hash[city] << name
		end
	end
	final_hash
end

=begin
def organize_schools(schools_hash)
	temp_hash = {}
	correct_hash = {}
	schools_hash.map do |school_name, location_hash|
		temp_hash = location_hash
		binding.pry
		temp_hash.each do |location, city|
			if location_hash == location_hash2
				correct_hash = {location_hash.values.join => [school_name]}
				binding.pry
			end
		end
		correct_hash
	end
end
=end

=begin
def organize_schools(schools_hash)
	counter = 0
	city_array = []
	while counter < schools_hash.length
		city_array << schools_hash.values[counter][:location]
		counter += 1
	end
end
=end






