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
        # else
        #     loopnum = Math.sqrt(isPrime).ceil
        #     puts "LoopNum: #{loopnum}"
        # for i in 3..loopnum
        #     if ((isPrime % i) == 0)
        #      ans = "Not Prime"
        #         break
        #     else
        #         ans = "Prime!!"
        #     end
        # end
        end
    return ans
    end
end # End Module