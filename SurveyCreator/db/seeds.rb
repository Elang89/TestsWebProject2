# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: "someuser@gmail.com", password: "password")
user2 = User.create(email: "user@gmail.com", password: "thepassword")

surveys = Survey.create([{name: "Some Survey", user_id: user.id, status: 0}, 
	{name: "The Survey", user_id: user.id, status: 1}, 
	{name: "Another survey", user_id: user2.id, status: 0}])

questions = Question.create([{question_content: "How good is it?", survey_id: surveys[0].id},
	{question_content: "How bad is it?", survey_id: surveys[0].id},
	{question_content: "What is it?", survey_id: surveys[0].id},
	{question_content: "Some question", survey_id: surveys[1].id},
	{question_content: "Another content", survey_id: surveys[1].id},
	{question_content: "Some other question", survey_id: surveys[1].id},
	{question_content: "Some question", survey_id: surveys[2].id},
	{question_content: "Another content", survey_id: surveys[2].id},
	{question_content: "Some other question", survey_id: surveys[2].id}])

results = Result.create([{survey_id: surveys[1].id}])

answers = Answer.create([{answer_content: "Very Good", result_id: results[0].id, question_id: surveys[0].id},
	{answer_content: "Bad", result_id: results[0].id, question_id: surveys[0].id},
	{answer_content: "Bad", result_id: results[0].id, question_id: surveys[0].id}])