<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8">
    <title>Diary</title>
    <meta name="viewport" content="width=device-width">
  </head>
  <body>
    % for message in messages:
    <p>{{message}}</p>
    % end
    <form method="post" action="/diary">
      <div>
        <textarea name="comment" style="width:200px;height:300px"></textarea>
      </div>
      <input type="submit" value="投稿">
    </form>
  </body>
</html>
