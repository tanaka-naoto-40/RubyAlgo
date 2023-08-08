# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Category.find_or_create_by(
  id: 1,
  name: "基礎編"
)
Category.find_or_create_by(
  id: 2,
  name: "応用編"
)
Category.find_or_create_by(
  id: 3,
  name: "実践編"
)
Course.find_or_create_by(
  id: 1,
  category_id: 1,
  name: "String",
  content: "Stringクラスに関する問題が出題される"
)
Course.find_or_create_by(
  id: 2,
  category_id: 1,
  name: "Numeric",
  content: "Numericクラスに関する問題が出題される"
)
Course.find_or_create_by(
  id: 3,
  category_id: 1,
  name: "Array",
  content: "Array"
)
Course.find_or_create_by(
  id: 4,
  category_id: 1,
  name: "Hash",
  content: "Hashクラスに関する問題が出題される"
)
Lesson.find_or_create_by(
  id: 1,
  course_id: 1,
  title: '問題１',
  content: '次のプログラムの実行結果として正しいものを選んでください。',
  published: true
)
Lesson.find_or_create_by(
  id: 2,
  course_id: 1,
  title: '問題2',
  content: '次のプログラムの実行結果として正しいものを選んでください。',
  published: true
)
Answer.find_or_create_by(
  id: 1,
  lesson_id: 1,
  content: '選択肢１',
  answer: true
)
Answer.find_or_create_by(
  id: 2,
  lesson_id: 1,
  content: '選択肢2',
  answer: false
)
Answer.find_or_create_by(
  id: 3,
  lesson_id: 1,
  content: '選択肢3',
  answer: false
)
Answer.find_or_create_by(
  id: 4,
  lesson_id: 1,
  content: '選択肢4',
  answer: false
)
Answer.find_or_create_by(
  id: 5,
  lesson_id: 2,
  content: '選択肢１',
  answer: true
)
Answer.find_or_create_by(
  id: 6,
  lesson_id: 2,
  content: '選択肢2',
  answer: false
)
Answer.find_or_create_by(
  id: 7,
  lesson_id: 2,
  content: '選択肢3',
  answer: false
)
Answer.find_or_create_by(
  id: 8,
  lesson_id: 2,
  content: '選択肢4',
  answer: false
)
