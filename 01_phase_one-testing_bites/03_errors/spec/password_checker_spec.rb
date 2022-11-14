require 'password_checker'

describe PasswordChecker do 
  it '#check returns true when passed a password longer than 7 chars' do
    password = PasswordChecker.new 
    expect(password.check('makersacademy')).to eq(true)
  end 
  it '#check returns error otherwise' do 
    password = PasswordChecker.new 
    expect { password.check('hello') }.to raise_error "Invalid password, must be 8+ characters."
  end
end