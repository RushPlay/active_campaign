# frozen_string_literal: true

class Hash
  # unless respo?(:to_query)
  def to_query(namespace = nil)
    collect do |key, value|
      unless (value.is_a?(Hash) || value.is_a?(Array)) && value.empty?
        value.to_query(namespace ? "#{namespace}[#{key}]" : key)
      end
    end.compact.sort! * '&'
  end
end

class Array
  def to_param
    collect(&:to_param).join '/'
  end

  # unless respo?(:to_query)
  def to_query(key)
    prefix = "#{key}[]"

    if empty?
      nil.to_query(prefix)
    else
      collect { |value| value.to_query(prefix) }.join '&'
    end
  end
end

class Object
  # unless respo?(:to_query)
  def to_query(key)
    "#{CGI.escape(key.to_param)}=#{CGI.escape(to_param.to_s)}"
  end

  def to_param
    to_s
  end
end

class TrueClass
  def to_param
    self
  end
end

class FalseClass
  def to_param
    self
  end
end

class NilClass
  def to_param
    self
  end
end
