class Checkprice
    def self.runcheck(illness)
        if illness == 1
            ans = "€50"
        elsif (illness == 2)
            ans = "€70"
        elsif (illness == 3)
            ans = "€90"
        elsif (illness == 4)
            ans = "€100"
        elsif (illness == 5)
            ans = "€120"
        end
    return ans
    end
end # End Module