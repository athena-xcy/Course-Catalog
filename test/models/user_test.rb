require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name:"example", email:"user@example.com", password: "foobar", password_confirmation: "foobar")
	end 

	test "should be valid"  do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = "     "
		assert_not @user.valid?
	end

	test "email should be present" do
		@user.email = "    "
		assert_not @user.valid?
	end

	test "name shouldn't be too long" do
		@user.name = "a" * 100
		assert_not @user.valid?
	end

	test "email validation should accept valid emails" do
		valid_addresses = %w["email@hap.com" "yes@good.com"]
		valid_addresses.each do |valid_address|
			assert @user.valid?, "#{valid_address.inspect} should be valid"
		end 
	end 

	test "email validation should reject invalid emails" do
		invalid_addresses = %w["email@hap,com" "hap@goodcom" ",,,com"]
		invalid_addresses.each do |invalid_address|
			@user.email = invalid_address
			assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
		end 
	end 

	test "email addresses should be unique" do
		duplicate_user = @user.dup	 
		duplicate_user.email = @user.email.upcase
		duplicate_user.save  
		assert_not duplicate_user.valid?
	end

	test "email should be saved as lower case" do
		email = "ABCDEFT@GMAIL.COM"
		@user.email = email 
		@user.save
		assert_equal email.downcase, @user.reload.email
	end

	test "password should be non_blank" do
		password = " " * 10
		@user.password = password
		@user.password_confirmation = password
		@user.save
		assert_not @user.valid?
	end

	test "password should have a minimum length" do
		password = "a" * 3
		@user.password = password
		@user.password_confirmation = password
		@user.save
		assert_not @user.valid?
	end 
end
