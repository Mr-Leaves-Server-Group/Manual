# 邀请子用户管理
邀请更多用户管理你的服务器，子用户帐户和普通帐户一样可以复用。

---

## 1.打开邀请用户界面
（左侧菜单现在的名字是 **【邀请用户】**，原名"子用户"）  
![管理界面](/assets/2.0/subuser-1.png)
<br>

## 2.邀请并填入权限
![邀请界面](/assets/2.0/subuser-2.png)
<br>

## 3.子用户登录后台
请让子用户在收到的邮件链接里完成密码设置，在 [【MLSG管理后台】](https://panel.mr-leaves.com/){target=_blank} 登录  
即可看到您共享的服务器，可以点击下方复制链接分享

<!-- Display the link and button in a flexbox container -->
<div class="copy-container">
    <code>https://panel.mr-leaves.com/</code>
    <button class="copy-btn" onclick="copyToClipboard()">点我复制链接</button>
</div>
<div id="notification" class="notification">链接已复制</div>

<!-- CSS for the button, notification, and flexbox container -->
<style>
.copy-container {
    display: flex;
    align-items: center; /* Vertically aligns items in the center */
    gap: 10px; /* Spacing between the code and button */
}

code {
    background-color: #f8f8f8;
    padding: 6px 10px;
    border-radius: 4px;
    height: 32px; /* Set a fixed height */
    display: flex;
    align-items: center; /* Align text in the center */
}

.copy-btn {
    background-color: #007BFF;
    border: none;
    color: white;
    padding: 6px 12px;
    font-size: 14px;
    height: 32px; /* Same fixed height as the code element */
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

.copy-btn:hover {
    background-color: #0056b3;
}

.notification {
    display: none;
    background-color: #28a745; /* green background */
    color: white;
    padding: 6px 10px;
    margin-top: 5px;
    border-radius: 3px;
    font-size: 12px;
}
</style>

<!-- JavaScript to copy the link to clipboard and show notification -->
<script>
function copyToClipboard() {
    const el = document.createElement('textarea');
    el.value = 'https://panel.mr-leaves.com/';
    document.body.appendChild(el);
    el.select();
    document.execCommand('copy');
    document.body.removeChild(el);
    
    // Show the notification
    const notification = document.getElementById('notification');
    notification.style.display = 'block';
    
    // Hide the notification after 3 seconds
    setTimeout(() => {
        notification.style.display = 'none';
    }, 3000);
}
</script>

<br>