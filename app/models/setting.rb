class Setting < RailsSettings::CachedSettings

# We used rails-settings-cached gem 
#
 validates_presence_of :var 
 before_save :set_value

 def set_value
 	return self.value = true if self.value.downcase == 'true'
 	return self.value = false if self.value.downcase == 'false'
 	if self.value.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
 	  return self.value = Integer(self.value) if Integer(self.value) rescue false
 	  return self.value = Float(self.value) rescue self.value
    end
  end
end
