judge_verdict = `ruby script.rb <<< cat input.txt > output.txt && diff output.txt expected_output.txt`
raise "FAILED TEST , \n\n #{judge_verdict}" unless judge_verdict.size == 0
puts "All tests passed\n"