module MultiplyPrimeNumbers
	
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods

    def multiplyprimenumbers(numbers=nil)
      no_of_primes = 150 if no_of_primes.nil?
      puts "1 \n2"
      
      i=1
      nextnum=3
      
      while i<numbers
        square_root_nextnum =  Math.sqrt(nextnum)
      	divisor = 2
      	while divisor <= square_root_number
      	  break if(nextnum % divisor == 0)
      	  divisor = divisor+1
      	end
      	     	
        if divisor > square_root_nextnum
          puts nextnum
          i = i+1
        end
        i=i+2
      end
    end
  end
end   

class ActiveRecord::Base
  include Math
  include MultiplyPrimeNumbers
end










module Uniquify
  def self.included(base)
    base.extend ClassMethods
  end

  def ensure_unique(name)
    begin
      self[name] = yield
    end while self.class.exists?(name => self[name])
  end

  module ClassMethods

    def uniquify(*args, &block)
      options = { :length => 8, :chars => ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a }
      options.merge!(args.pop) if args.last.kind_of? Hash
      args.each do |name|
        before_validation :on => :create do |record|
          if block
            record.ensure_unique(name, &block)
          else
            record.ensure_unique(name) do
              Array.new(options[:length]) { options[:chars].to_a[rand(options[:chars].to_a.size)] }.join
            end
          end
        end
      end
    end

  end
end

class ActiveRecord::Base
  include Uniquify
end
