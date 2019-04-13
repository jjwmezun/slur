class Evaluator
	def initialize
		@functions =
		{
			"+" => -> ( args ) {
				answer = 0;
				args.each do | a |
					answer += Integer( e a )
				end
				answer
			},
			"-" => -> ( args ) {
				answer = Integer( e args.pop );
				while not args.empty?
					answer -= Integer( e args.pop )
				end
				answer
			},
			"\"" => -> ( args ) {
				e args.pop
			},
			"print" => -> ( args ) {
				args.each do | a |
					p e a
				end
				nil
			},
			"print to file" => -> ( args ) {
				File.write( File.expand_path( e( args.pop ) ), e( args.pop ) )
				nil
			}
		}
	end

	def eval code
		code.each do | f |
			e f
		end
	end

	def e code
		if code.is_a? Array
			code.reverse!
			function = code.pop
			if not @functions.key? function
				throw "NO FUNC! #{ function }"
			else
				e @functions[ function ].call code
			end
		else
			code
		end
	end
end
