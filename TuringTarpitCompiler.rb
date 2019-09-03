=begin
	=> Do not copy
	=> @ Raphael Spoerri
	=> Let's see it in action:
=end

def compile (code, show = false)

#Make sure the front end doesn't choke on commas
  	reg = /\S\,/
	while reg.match(code)
	
		before = reg.match(code)[0]
		after = before.sub(/,/, " ,")
		code = code.sub(before, after)
		
	end
#Make sure the front end doesn't choke on increment
	reg = /\S\+\+/
	while reg.match(code)
	
		before = reg.match(code)[0]
		after = before.sub(/\+\+/, " ++")
		code = code.sub(before, after)
		
	end
#Make sure the front end doesn't choke on decrement
	reg = /\S\-\-/
	while reg.match(code)
	
		before = reg.match(code)[0]
		after = before.sub(/\-\-/, " --")
		code = code.sub(before, after)
		
	end
	
#divide the input into lines:
	code = code.split("\n")
	lexer = []
#then into tokens
	code.each do |line|
		lexer << line.split(/\s/)
	end
	#this string will be the code compiled to Ruby
	out = "def ask\n\treturn gets.to_f\nend\n"
	#iterate
	for line in lexer
		for lex in line
			case lex
				# Is equal to?
				when "=?"
					out += " == "
				#assignment operator, ":=" is to Pascal-y
				when "="
					out += " = "	
				#the absence of value, like null, called `nil` in Ruby
				#I chose the prefix `mal` because it means `bad` or `messed up`
				when "Mal"
					out += "nil "
				when "If"
					out += "if "
				when "Func"
					out += "def "
				when "++"
					out += " + 1"
				when "--"
					out += " - 1"
				when "End"
					out += "end"
				when "Return"
					out += "return "
				#most importan
				when "Print"
					out += "print "
				#comment ;)
				when "?:"
					out += "#"	
				else
					unless /[^\w\(\)\>\<,\-\=\.]/.match(lex)
						case lex.sub(/\(.*\)/, "").strip
							#try to weed out other predefined functions and keywords
							when "puts", "gets", "else", ".to_i", "to_f", "to_a", "to_s", "and", "or", "not", "while", "else", "for", "elsif", "nil"
								#DO ABSOLUTELY NOTHING
							else
							out += lex + " "
						end
					end
			end
		end
		#don't forget the line feed
		out += "\n"
	end
	if show
		puts out + "\n\n"
	end
	eval out
end



#our code...
x = %{

?: logical op `&`
Func AND a, b
	If a 
		If b
			Return 1
		End
	End
	Return Mal
End

?: logical op `|`
Func OR a, b
	If a 
		Return 1
	End
	If b
		Return 1
	End
	Return Mal
End
Func pos i, x = 0
	If i < 0
		Return pos i++, x++
	End
	Return x
End
Func add a, b
	If a < 1
		Return b
	End
	Return add a--, b++
End
Func sub a, b
	If b > 0
		Return sub a--, b--
	End
	Return a
End
Func mul a, b, c = Mal
	If AND a < 0, b < 0
		a = pos a
		b = pos b
	End
	If c =? Mal
		c = b
		b = 0
	End
	If a > 0
		Return mul a--, add(b, c), c
	End
	Return b
End

Func flrdiv a, b, count = 0
	If AND a =? 0, b =? 0
		Return 0
	End
	If sub(a, b) >= 0
		Return div sub(a, b), b, count ++
	End
	Return count
End
}

#end code section

#now Run!
compl x, 5


