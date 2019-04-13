require_relative 'Parser'
require_relative 'Evaluator'

if ARGV.length > 0
	code = File.open( ARGV[ 0 ] ).read
	Evaluator.new.eval Parser.new.parse code.strip
end
