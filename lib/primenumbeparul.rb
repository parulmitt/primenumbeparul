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








