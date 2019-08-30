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

    def my_map
        return to_enum(:my_map) unless block_given?
        output = []
        self.my_each {|x|
            output << yield(x)
        }
        output
    end

    def my_inject
            
            


end

