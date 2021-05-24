<?php
require_once('plugins/login-password-less.php');

// Password is 'midbrain', shhhhhhhhh.....
return new AdminerLoginPasswordLess(
    $password_hash = '$2y$10$A6A8NjpFj1/n5P94JxAOCeAKV0Mj7qtKhpmbV.IAqYuc2Y7hsoXEi'
);
