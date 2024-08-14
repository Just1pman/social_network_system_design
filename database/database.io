// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

enum fileType {
  picture
}

Table users {
  id integer [primary key]
  nickname varchar(32)
  created_at timestamp
}

Table posts {
  id integer [primary key]
  user_id integer
  place_id integer [null]
  description varchar(1500)
  count_likes integer
  count_comments integer
  files integer
  created_at timestamp
}

Table comments {
  id integer [primary key]
  post_id integer
  parent_comment_id integer
  text varchar(1500)
  created_at timestamp
}

Table media_files {
  id integer [primary key]
  link varchar
  type fileType
  created_at timestamp
}

Table post_files {
  id integer [primary key]
  order_number integer
  post_id integer
  file_id integer
}

Table likes {
  id integer [primary key]
  user_id integer
  post_id integer
}

Table subscriptions {
  id integer [primary key]
  user_id integer
  start_date timestamp
  related_user_id integer
}

Table geo_posts {
  id integer [primary key]
  post_id integer
  longtitude float
  latitude float
}

Table places {
  id integer [primary key]
  name varchar(3000)
  lonlongtitude float
  latitude float
}

Ref: comments.parent_comment_id > comments.id
Ref: users.id < posts.user_id
Ref: places.id < posts.place_id
Ref: comments.post_id > posts.id
Ref: geo_posts.post_id - posts.id
Ref: likes.post_id <> posts.id
Ref: likes.user_id <> users.id
Ref: post_files.file_id - media_files.id
Ref: post_files.post_id > posts.id
Ref: subscriptions.user_id <> users.id
Ref: subscriptions.related_user_id <> users.id
Ref: posts.files < post_files.file_id