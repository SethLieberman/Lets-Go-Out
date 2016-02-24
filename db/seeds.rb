# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create([
	{username:"ShefSeth", password:"pw", fname:"Seth", lname:"Lieberman", email:"shefseth@gmail.com",zipcode: "19103"},
	{username:"Bob The Slob", password:"pw", fname:"Bob", lname:"Pooperton", email:"b@b",zipcode: "19104"},
	{username:"Bess The Mess", password:"pw", fname:"Bess", lname:"Hessper", email:"bess@b",zipcode: "08003"},
	{username:"Jilly From Philly", password:"pw", fname:"Jillian", lname:"Lieberman", email:"j@j",zipcode: "19103"},
	{username:"Billy Bob", password:"pw", fname:"Billy", lname:"Thorton", email:"billy@b",zipcode: "19107"},
	{username:"Stan the Man", password:"pw", fname:"Stan", lname:"Smith", email:"s@s",zipcode: "19107"},
	{username:"Kenny", password:"pw", fname:"Kennny", lname:"Powers", email:"k@k",zipcode: "08003"},
	{username:"Phil the Pill", password:"pw", fname:"Phil", lname:"Wonkers", email:"phil@p",zipcode: "19103"},
	{username:"Bubby Issy", password:"pw", fname:"Issy", lname:"Rudolph", email:"issy@i",zipcode: "19107"},
	{username:"MarthaStewart", password:"pw", fname:"Martha", lname:"Stewart", email:"martha@m",zipcode: "19107"}
	])

Group.create([
	{title:"Lieberman's Group", user_id: 1},
	{title:"Friends Forever", user_id: 1},
	{title:"HighSchool", user_id: 2},
	{title:"Party Group", user_id: 3},
	{title:"HoneyMoon", user_id: 4},
	{title:"Bro's Fo Sho", user_id: 5},
	{title:"Brothers", user_id: 6}
	])