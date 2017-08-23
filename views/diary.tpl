<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8">
    <title>Diary</title>
    <style type="text/css">
<!--
textarea {
  border:2px solid #e8e8e8;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
}
-->
    </style>
    <meta name="viewport" content="width=device-width">
  </head>
  <body>
    % for message in messages:
    <p>{{message}}</p>
    % end
    <form method="post" action="/diary">
      <div>
        <textarea name="comment" style="width:400px;height:300px"></textarea>
      </div>
      <input type="submit" value="save">
    </form>
  </body>
</html>
