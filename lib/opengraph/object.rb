module OpenGraph
  # The OpenGraph::Object is a Hash with method accessors for
  # all detected Open Graph attributes.
  class Object < Hashie::Mash
    MANDATORY_ATTRIBUTES = %w(title type image url)
    
    # The object type.
    def type
      self['type']
    end
    
    # The schema under which this particular object lies. May be any of
    # the keys of the TYPES constant.
    def schema
      OpenGraph::TYPES.each_pair do |schema, types| 
        return schema if types.include?(self.type)
      end
      nil
    end
    
    TYPES.values.flatten.each do |type|
      define_method "#{type}?" do
        self.type == type
      end
    end
    
    TYPES.keys.each do |scheme|
      define_method "#{scheme}?" do
        self.type == scheme || TYPES[scheme].include?(self.type)
      end
    end
    
    # If the Open Graph information for this object doesn't contain
    # the mandatory attributes, this will be <tt>false</tt>.
    def valid?
      MANDATORY_ATTRIBUTES.each{|a| return false unless self[a]}
      true
    end
  end
end
