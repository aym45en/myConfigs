import random
import string

def generate_password(length):
    characters = string.ascii_letters + string.digits + '@#$&%'
    password = ''.join(random.choice(characters) for i in range(length))
    return password

# Generate a 16-character random password with special characters
print(generate_password(26))

