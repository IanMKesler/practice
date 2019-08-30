#require 'pry'; binding.pry
module Enumerable 
    def my_each
        return to_enum(:my_each) unless block_given?
        for i in self
            yield(i) 
        end
        self
    end

    def my_each_with_index
        return to_enum(:my_each_with_index) unless block_given?
        for i in (0...self.length)
            yield(self[i], i)
        end
        self
    end

    def my_select
        return to_enum(:my_select) unless block_given?
        output = []
        self.my_each {|x|
            output << x if yield(x)
        }
        output
    end

    def my_all? 
        unless block_given?
            self.my_each{|x|
                return false unless x
            }
            return true
        else
            self.my_each {|x| 
                return false unless yield(x)
            }
            return true
        end
    end

    def my_none?(pattern = nil)
        if pattern
            self.my_each{|x|
                return false if x.class == pattern
            }
            return true
        elsif block_given?
            self.my_each {|x| 
                return false if yield(x)
            }
            return true
        else
            self.my_each {|x|
                return false if x
            }
            return true
        end
    end

    def my_count(pattern=nil)
        count = 0
        if pattern
            self.my_each{|x|
                count += 1 if x == pattern
            }
            return count
        elsif block_given?
            self.my_each{|x|
                count += 1 if yield(x)
            }
            return count
        else
            count = self.length
            return count
        end
    end

    def my_map(proc = nil)
        return to_enum(:my_map) unless block_given? || proc
        output = []
        if proc
            self.my_each {|x|
                output << proc.call(x)
            }
            output
        else
            self.my_each {|x|
                output << yield(x)
            }
            output
        end
    end

    def my_inject(arg1=nil, arg2=nil)
        args = [arg1, arg2, block_given?]
        case 
        when args[0..1].my_all? && !args[2]
            result = args[0]
            operation = args[1].to_proc #converts arg[1] into a proc using the .arg[1] method
            self.my_each {|x|
                result = operation.call(result,x)
            }
            return result
        when args[0] && !args[1] && !args[2]
            result = self[0]
            operation = args[0].to_proc 
            self.my_each_with_index {|x,i|
                result = operation.call(result,x) unless i == 0
            }
            return result
        when args[0] && !args[1] && args[2]
            result = args[0]
            self.my_each {|x|
                result = yield(result, x)
            }
            return result
        when args[0..1].my_none? && args[2]
            result = self[0]
            self.my_each_with_index {|x,i|
                result = yield(result,x) unless i == 0
                puts result
            }
            return result
        end
    end

end

def multiply_els(array)
    array.my_inject(:*)
end