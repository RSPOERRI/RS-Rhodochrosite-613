module RegExp
	class Matcher
		def initialize str
			@str = str
		end
		def subInSub search, reg, rep
			while search.match? @str
				@before = search.match(@str)[0]
				@after = @before.gsub(reg, rep)
				@str = @str.sub @before, @after
			end
			return @str
		end
		def lastMatch search
			@x = @str
			@last = -1
			while search.match? @x
				@last = search.match @x
				@x = @x.sub(search, "")
			end
			return @last
		end
		def matchWithRange search, r
			unless r[1]
				r[1] = @str.length
			end
			@slc = @str.slice(r[0], r[1])
			if r[2] == -1
				x = RegExp::Matcher.new @str
				return x.lastMatch search
			end
		end
	end
end
