class Parser
	def initialize
		@data = []
		@stack = []
		@current_arg = ""
	end

	def parse code
		code.each_char do | c |
			case c
				when "("
					if isOutsideFunction
						@data.push []
						@stack.push @data.last
					else
						@stack.last.push []
						@stack.push @stack.last.last
					end
				# end

				when ")"
					if isOutsideFunction
						throw "AHHHH!"
					else
						moveCurrentArgToData
						@stack.pop
					end
				# end

				when ","
					if isOutsideFunction
						throw "Error!"
					else
						moveCurrentArgToData
					end
				# end

				else
					if isOutsideFunction
						#ignore
					else
						@current_arg += c
					end
				# end
			end
		end
		@data
	end

	def moveCurrentArgToData
		@current_arg.strip!
		@stack.last.push @current_arg unless @current_arg.empty?
		@current_arg = ""
	end

	def isOutsideFunction
		@stack.empty?
	end
end
