class Configuration

	def values 
		return @values
	end

	def initialize(inputFile)	
		@values = {}	
		IO.foreach(inputFile){|line|
			line.strip!
			if line.start_with?("#")
				#Skipping comment lines
				next
			end
			configPair = line.split("=")
			if configPair.count != 2
				#Improperly formed line, skipping
				next
			end
			# Assure no spaces in the key for method & symbol rules
			key = configPair[0].strip.gsub(" ", "_").to_sym
			value = format_value configPair[1].strip
			# Store the value in values for lookup
			@values[key] = value
			# Also add a method to get the value.  
			
			self.define_singleton_method(key) do 
				return @values[key]
			end
			
		}		
	end

	private

	def format_value(value)
		if is_bool? value
			return to_bool value
		end
		if is_integer? value
			return Integer(value)
		end
		if is_float? value
			return Float(value)
		end
		value
	end

	@@TRUE_SYNONYMS = ['true', 'yes', 'on']
	@@FALSE_SYNONYMS = ['false', 'no', 'off']

	def is_bool?(value)
		if @@TRUE_SYNONYMS.include? value.downcase or @@FALSE_SYNONYMS.include? value.downcase
			return true		
		end		
		false
	end	

	def is_integer?(value)
		begin
			Integer(value) 
			true
		rescue
			false
		end
	end

	def is_float?(value)
		begin
			Float(value) 
			true
		rescue
			false
		end
	end

	def to_bool(value)		
		if @@TRUE_SYNONYMS.include? value.downcase
			return true
		end
		if @@FALSE_SYNONYMS.include? value.downcase
			return false
		end				
	end	
end