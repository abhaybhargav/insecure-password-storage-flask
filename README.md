# Password Demo Application

This application demonstrates secure and insecure password storage practices using a Python Flask application. It's designed for educational purposes to help developers understand the importance of proper password handling.


## Getting Started

2. Build the Docker image:
   ```
   docker build -t insecure-password-flask .
   ```

3. Run the Docker container:
   ```
   docker run -p 8880:8880 insecure-password-flask
   ```

4. Access the application in your web browser at `http://localhost:8880`

## Interacting with the Application

1. Sign Up:
   - Navigate to `http://localhost:8880/signup`
   - Enter a `test` and `password` for the username and password
   - Keep the "secure" option unchecked for now
   - Click "Sign Up"

2. Log In:
   - Navigate to `http://localhost:8880/login`
   - Enter your username and password
   - Click "Login"

3. View Home Page:
   - After logging in, you'll be redirected to the home page
   - This page is only accessible to logged-in users

4. Log Out:
   - Click the "Logout" link in the navigation bar

## Accessing the Database

The application uses a SQLite database. To access and inspect the database:

1. Start an interactive shell in the running Docker container:
   ```
   docker exec -it <container_id> /bin/bash
   ```
   Replace `<container_id>` with the actual container ID or name.

2. Inside the container, start the SQLite command-line tool:
   ```
   sqlite3 /app/instance/users.db
   ```

3. You can now run SQL queries to inspect the database. For example:
   ```sql
   SELECT * FROM user;
   ```

   > copy the hash generated

Now run the following command to store the hash

```bash
echo -n "<hash>" > /app/hash.txt
```

4. To exit the SQLite prompt, type `.quit`

5. Now let's try and crack the hash

```bash
hashcat -m 0 -a 0 /app/hash.txt /app/wordlist.txt
```
> You'll see that the hash is cracked comfortably

5. To exit the Docker container shell, type `exit`

## Security Notes

- This application is for educational purposes only and should not be used in production environments.
- The "insecure" option uses MD5 hashing, which is not suitable for password storage in real-world applications.
- Always use secure hashing algorithms (like bcrypt) for storing passwords in production applications.

## Contributing

Feel free to submit issues and enhancement requests.

## License

[MIT License](LICENSE)