module MockIO
  def with_mock_io
    stdin, user_input = IO.pipe
    stdout = StringIO.new

    yield stdin, user_input, stdout
  ensure
    user_input.close
    stdin.close
    stdout.close
  end
end
