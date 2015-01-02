<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8">
    <title>Diary</title>
  </head>
  <body>
    % for message in messages:
    <p>{{message}}</p>
    % end
    <form method="post" action="/diary">
      <div>
        <textarea name="comment">
        </textarea>
      </div>
      <input type="submit" value="投稿">
    </form>
  </body>
</html>
